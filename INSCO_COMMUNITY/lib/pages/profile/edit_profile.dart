import 'dart:io';

import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/pages/gallery/upload.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../homepage.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController workText = TextEditingController();

  bool isLoading = false;
  bool _bioValid = false;
  bool _phoneValid = true;
  bool _worktextValid = false;
  File file;
  String postId = Uuid().v4();
  String mediaUrl;

  @override
  void initState() {
    super.initState();
    getPreData();
  }

  getPreData() {
    bioController.text = currentUser.bio;
    phoneNumberController.text = currentUser.mobileNumber.toString();
    workText.text = currentUser.workPlace;
  }

  void updateProfileData() async {
    setState(() {
      bioController.text.trim().length > 100
          ? _bioValid = false
          : _bioValid = true;

      workText.text.trim().length > 100
          ? _worktextValid = false
          : _worktextValid = true;

      phoneNumberController.text.trim().length >= 11
          ? _phoneValid = true
          : _phoneValid = false;
    });
    
    if(file!= null){
      mediaUrl = await uploadImage(file);
    }

    if (_bioValid && _worktextValid) {
      try {
        FirebaseFirestore.instance
            .collection('accounts')
            .doc(currentUser.id)
            .update({
          "bio": bioController.text,
          "mobileNumber": _phoneValid ? phoneNumberController.text : currentUser.mobileNumber,
          "workPlace": workText.text,
          'photoUrl': file != null ? mediaUrl : currentUser.photoUrl,
        }).whenComplete(() {
          _scaffoldKey.currentState.showSnackBar(
              snackbar(snackText: "Profile is Successfully Updated!"));
          Future.delayed(const Duration(seconds: 1));
          getUserData();
          Navigator.pop(context);
        });
      } catch (e) {
        _scaffoldKey.currentState
            .showSnackBar(snackbar(snackText: "Something went Wrong!"));
      }
    }
  }

  SnackBar snackbar({String snackText}) {
    return SnackBar(
      content: Text(snackText),
      backgroundColor: Colors.purple[300],
      behavior: SnackBarBehavior.floating,
    );
  }

  handleChooseFromGallery() async {
    file = File(await ImagePicker.pickImage(source: ImageSource.gallery)
        .then((pickedFile) => pickedFile.path));
    setState(() {
      this.file = file;
      print('file piclked');
    });
  }

  clearImage() {
    setState(() {
      file = null;
    });
  }

  Future<String> uploadImage(imageFile) async {
    UploadTask uploadTask = storageRef
        .child("profile/${currentUser.username}/profile_$postId.jpg")
        .putFile(imageFile);
    TaskSnapshot storageSnap =
        await uploadTask.whenComplete(() => debugPrint('task completed'));
    // TaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colour.primaryColor,
      appBar: AppBar(
        title: Center(child: Text("Profile")),
        automaticallyImplyLeading: true,
        backgroundColor: Colour.buttonColor,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.done),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: 70.0,
                            backgroundColor: Colour.buttonColor,
                            backgroundImage: file == null
                                ? AssetImage("./assets/images/avtar.png")
                                : FileImage(file)),
                        GestureDetector(
                            onTap: handleChooseFromGallery,
                            child: Icon(
                              Icons.add_a_photo_rounded,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Center(
                  child: Text(
                    currentUser.username,
                    style: GoogleFonts.lato(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    currentUser.email,
                    style: GoogleFonts.lato(
                        fontSize: 13,
                        color: Colour.buttonColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                buildTextField(
                  placeholder: currentUser.bio,
                  labelText: 'About',
                  controller: bioController,
                ),
                SizedBox(
                  height: 15.0,
                ),
                buildTextField(
                  placeholder: currentUser.workPlace,
                  labelText: 'Work at',
                  controller: workText,
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: 'Whatshapp Contact',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Whatshapp contact no",
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Contact is not menadotry but it can be useful for communication and to reach any needy member to you.",
                  style: TextStyle(color: Colors.red[300], fontSize: 10.0),
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      updateProfileData();
                    },
                    child: Text('Update'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

TextField buildTextField({
  String labelText,
  String placeholder,
  TextEditingController controller,
}) {
  return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 3),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
      ));
}