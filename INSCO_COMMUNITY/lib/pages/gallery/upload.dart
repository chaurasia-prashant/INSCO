import 'dart:io';
import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:image/image.dart' as Im;
import '../homepage.dart';

final storageRef = FirebaseStorage.instance.ref();
final postsRef = FirebaseFirestore.instance.collection("gallery");

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload>
    with AutomaticKeepAliveClientMixin<Upload> {
  TextEditingController captionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  File file;
  bool isUploading = false;
  String postId = Uuid().v4();

  handleChooseFromGallery() async {
    file = File(await ImagePicker.pickImage(source: ImageSource.gallery)
        .then((pickedFile) => pickedFile.path));
    setState(() {
      this.file = file;
      // print('file piclked');
    });
  }

  clearImage() {
    setState(() {
      file = null;
    });
  }

  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file.readAsBytesSync());
    final compressedImageFile = File('$path/img_$postId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 85));
    setState(() {
      file = compressedImageFile;
    });
  }

  Future<String> uploadImage(imageFile) async {
    UploadTask uploadTask =
        storageRef.child("gallery/post_$postId.jpg").putFile(imageFile);
    TaskSnapshot storageSnap =
        await uploadTask;
    // TaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  createPostInFirestore({String mediaUrl, String description}) {
    postsRef.doc(postId).set({
      "postId": postId,
      "mediaUrl": mediaUrl,
      "description": description,
      "senderId": currentUser.id,
    });
  }

  handleSubmit() async {
    await compressImage();
    String mediaUrl = await uploadImage(file);
    createPostInFirestore(
      mediaUrl: mediaUrl,
      description: captionController.text,
    );
    captionController.clear();
    setState(() {
      file = null;
      isUploading = false;
      postId = Uuid().v4();
      // await Future.delayed(const Duration(milliseconds: 500));
      Navigator.pop(context);
    });
  }

  Scaffold buildUploadForm() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
              clearImage();
            }),
        title: Text(
          "About Post",
          style: TextStyle(color: Colors.black),
        ),
        // actions: [
        //   GestureDetector(
        //     onTap: file == null ? handleChooseFromGallery : null,
        //     child: Container(
        //       child: Icon(Icons.add_a_photo),
        //     ),
        //   )
        // ],
      ),
      body: ListView(
        children: <Widget>[
          isUploading ? LinearProgressIndicator() : Text(""),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              width: double.infinity,
              child: file == null
                  ? GestureDetector(
                      onTap: file == null ? handleChooseFromGallery : null,
                      child: Material(
                        color: Colour.greyLight,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colour.buttonColor,
                          size: 50.0,
                        ),
                      ))
                  : Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(file),
                        ),
                      ),
                    ),
            ),
          ),
          SizedBox(height: 40.0),
          ListTile(
            title: Container(
              width: 250.0,
              child: TextField(
                minLines: 1,
                maxLines: 4,
                controller: captionController,
                decoration: InputDecoration(
                  hintText: "Add caption to this post...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 50.0),
          Center(
            child: Material(
              color: Colour.buttonColor,
              elevation: 8.0,
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              child: GestureDetector(
                onTap: () {
                  if (file != null) {
                    handleSubmit();
                    setState(() {
                      isUploading = true;
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 50.0),
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colour.primaryColor),
                  ),
                ),
              ),
            ),
          ),
          // RaisedButton(
          //   onPressed: () {
          //     handleSubmit();
          //     setState(() {
          //       isUploading = true;
          //     });
          //   },
          //   child: Text('Upload'),
          // ),
        ],
      ),
    );
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return buildUploadForm();
  }
}

// actions: [GestureDetector(
//            onTap: () async {
//             Authentication authentication = Authentication();
//             await authentication.logoutUser();
//             Navigator.pushAndRemoveUntil<dynamic>(
//               context,
//               MaterialPageRoute<dynamic>(
//                 builder: (BuildContext context) => WelcomePage(),
//               ),
//               (route) =>
//                   false, //if you want to disable back feature set to false
//             );
//             Navigator.push(context,
//                 CustomPageRoute(widget: WelcomePage()));
//           },
//           child: Icon(Icons.logout))],
