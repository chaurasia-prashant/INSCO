import 'dart:io';
import 'package:image/image.dart' as Im;
import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/pages/gallery/upload.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../homepage.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController workText = TextEditingController();

  bool showLoading = false;
  bool _bioValid = true;
  bool _phoneValid = true;
  bool _worktextValid = true;
  File file;
  String postId = Uuid().v4();
  String mediaUrl;
  String prePhotoId;

  @override
  void initState() {
    super.initState();
    getPreData();
  }

  getPreData() {
    bioController.text = currentUser.bio;
    phoneNumberController.text = currentUser.mobileNumber;
    workText.text = currentUser.workPlace;
    prePhotoId = currentUser.photoId;
  }

  void updateProfileData() async {
    setState(() {
      bioController.text.trim().length < 100
          ? _bioValid = true
          : _bioValid = false;

      workText.text.trim().length < 100
          ? _worktextValid = true
          : _worktextValid = false;

      phoneNumberController.text.trim().length == 10 ||
              phoneNumberController.text.trim().length == 0
          ? _phoneValid = true
          : _phoneValid = false;
    });

    if (_bioValid && _worktextValid && _phoneValid) {
      try {
        setState(() {
          showLoading = true;
        });
        if (file != null) {
          await compressImage();
          mediaUrl = await uploadImage(file);
        }
        FirebaseFirestore.instance
            .collection('accounts')
            .doc(currentUser.id)
            .update({
          "bio": bioController.text,
          "mobileNumber": _phoneValid
              ? phoneNumberController.text
              : currentUser.mobileNumber,
          "workPlace": workText.text,
          'photoUrl': file != null ? mediaUrl : currentUser.photoUrl,
          'photoId': postId,
        }).whenComplete(() async {
          setState(() {
            showFlushBar(context,
                title: 'Profile Alert',
                message:
                    "Profile update initiated and will updated in a moment !");
            showLoading = false;
            getUserData();
          });
        });
      } catch (e) {
        setState(() {
          showFlushBar(context, title: 'Profile Alert', message: e.message);
          showLoading = false;
        });
      }
    } else {
      setState(() {
        showFlushBar(context,
            title: 'Profile Alert',
            message:
                'Entered Information is not accepted\nAbout and Work info must have less then 100 letters\nPhone number must have 10 digits');
      });
    }
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
    UploadTask uploadTask = storageRef
        .child("profile/${currentUser.username}/profile_$postId.jpg")
        .putFile(imageFile);
    TaskSnapshot storageSnap = await uploadTask;
    // TaskSnapshot storageSnap = await uploadTask.onComplete;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.primaryColor,
      appBar: AppBar(
        title: Center(child: Text("Edit Profile")),
        automaticallyImplyLeading: true,
        backgroundColor: Colour.buttonColor,
        // actions: [
        //   GestureDetector(
        //     onTap: () {},
        //     child: Icon(Icons.done),
        //   )
        // ],
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
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        Material(
                          color: Colour.primaryColor,
                          elevation: 10.0,
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircleAvatar(
                                radius: 70.0,
                                backgroundColor: Colour.primaryColor,
                                backgroundImage: file == null
                                    ? currentUser.photoUrl == ''
                                        ? AssetImage(
                                            './assets/images/avtar.png')
                                        : CachedNetworkImageProvider(
                                            currentUser.photoUrl)
                                    : FileImage(file)),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                              onTap: handleChooseFromGallery,
                              child: Material(
                                color: Colour.buttonColor,
                                elevation: 10.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.add_a_photo_rounded,
                                    color: Colour.primaryColor,
                                  ),
                                ),
                              )),
                        ),
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
                    hintText: phoneNumberController.text,
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Plese enter a valid whatshapp number.",
                  style: TextStyle(color: Colors.red[300], fontSize: 10.0),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Contact is not menadotry but it can be useful for communication and to reach any needy member to you.",
                  style: TextStyle(color: Colors.red[300], fontSize: 10.0),
                ),
                SizedBox(height: 30.0),
                Center(
                  child: showLoading
                      ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                            color: Colour.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: CircularProgressIndicator(),
                            )),
                      )
                      : Material(
                        color: Colour.buttonColor,
                          elevation: 8.0,
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0)),
                          child: GestureDetector(
                            onTap: () {
                              updateProfileData();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 30.0),
                              child: Text('Update', style: TextStyle(color: Colour.primaryColor),),
                            ),
                          ),
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
      minLines: 1,
      maxLines: 4,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 3),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
      ));
}
