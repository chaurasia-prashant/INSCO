import 'package:INSCO_COMMUNITY/component/chat_constants.dart';
import 'package:INSCO_COMMUNITY/modal/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:INSCO_COMMUNITY/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _firestore = FirebaseFirestore.instance;

class DiscussionScreen extends StatefulWidget {
  @override
  _DiscussionScreenState createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  final messageTextController = TextEditingController();
  String messageText;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        title: Center(child: Text("Chat")),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _firestore.collection('messages').add({
                        'id': currentUser.id,
                        'sender': currentUser.username,
                        'batch': currentUser.batch,
                        'title': currentUser.title,
                        'msg': messageText,
                        'msgTime' : DateTime.now(),
                      });
                      messageTextController.clear();
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection("messages").orderBy('msgTime', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),
          );
        }
        // final messages = snapshot.data.docs;
        List<MessageBox> messageWidgets = [];
        snapshot.data.docs.forEach((doc) {
          ChatData message = ChatData.fromJson(doc.data());
          MessageBox msgs = MessageBox(message);
          messageWidgets.add(msgs);
        });
        return Expanded(
          child: ListView(
            reverse: true,
            children: messageWidgets,
          ),
        );
      },
    );
  }
}

class MessageBox extends StatelessWidget {
  final ChatData message;

  MessageBox(this.message);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: currentUser.username == message.sender
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 7.0),
            child: Text(
              message.sender,
              style: GoogleFonts.lato(color: Colors.grey[200], fontSize: 8.0),
            ),
          ),
          Padding(
            padding: currentUser.username == message.sender
                ? EdgeInsets.only(right: 5.0, left: 60.0)
                : EdgeInsets.only(right: 60.0, left: 5.0),
            child: Material(
              borderRadius: currentUser.username == message.sender
                  ? BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    )
                  : BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
              elevation: 5.0,
              color: currentUser.username == message.sender
                  ? Colors.deepPurpleAccent
                  : Colors.blue,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  child: Text(
                    message.msg,
                    style:
                        GoogleFonts.lato(color: Colors.white, fontSize: 12.0),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
