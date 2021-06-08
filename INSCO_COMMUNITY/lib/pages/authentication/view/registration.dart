
import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/widget/drop_down.dart';
import 'package:INSCO_COMMUNITY/widget/flatbutton.dart';
import 'package:INSCO_COMMUNITY/widget/font_text.dart';
import 'package:INSCO_COMMUNITY/widget/text_field.dart';
import 'package:INSCO_COMMUNITY/pages/authentication/firebase_auth/authentication.dart';
import 'package:INSCO_COMMUNITY/pages/appStartPages/intro_page.dart';
// import 'package:INSCO_COMMUNITY/pages/homepage.dart';
// import 'package:INSCO_COMMUNITY/helper/local_storage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:INSCO_COMMUNITY/helper/screen_size.dart';
import 'package:INSCO_COMMUNITY/helper/validators.dart';
import 'package:INSCO_COMMUNITY/modal/account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    arr();
  }

  bool isMember = false;
  bool changePage = false;
  String userTitle = 'User';
  int userBatch = 2018;
  String name;
  String email;
  String password;
  String id;
  Authentication authentication = Authentication();
  List titleOption = ['HOD', 'Former HOD', 'Teacher', 'Student', 'User'];
  List batch = [];
  DateTime timestamp = DateTime.now();
  void arr() {
    for (int i = 1974; i <= timestamp.year; i++) {
      batch.add(i);
    }
  }

  Scaffold detailPage(screen) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(screen.horizontal(4.0)),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: screen.vertical(140.0),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: screen.horizontal(8.0),
                          backgroundColor: Colour.lineColor,
                          child: IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_left,
                              color: Colors.white,
                              size: screen.horizontal(8.0),
                            ),
                            onPressed: () {
                              /*
                              this code is for testing
                              LocalStorage localStorage = LocalStorage();
                              // if (localStorage.prefs == null) {
                              //   await localStorage.init();
                              // }
                              // bool pass =
                              //     localStorage.prefs.getBool('isInscoMember');
                              */
                              //TODO implement back function
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screen.vertical(15.0),
                    ),
                    LatoText(
                      "Let's integrate with INSCO Community",
                      size: 25,
                    ),
                    SizedBox(
                      height: screen.vertical(45.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Your Name',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ),
                    CustomTextField(
                      hintText: 'Type your name',
                      textAlignment: TextAlign.start,
                      keyboard: TextInputType.name,
                      validator: usernameValidator,
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    SizedBox(
                      height: screen.vertical(15.0),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Are you a pre student of INSCO?',
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colour.lineColor),
                            ),
                          ),
                        ),
                        Switch(
                          value: isMember,
                          onChanged: (value) {
                            setState(() {
                              isMember = value;
                            });
                          },
                          inactiveTrackColor: Colour.lineColor,
                          activeTrackColor: Colour.buttonColor,
                          activeColor: Colour.buttonColor,
                        ),
                      ],
                    ),
                    isMember
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Select Your Batch',
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          )
                        : SizedBox(height: 0.0),
                    isMember
                        ? DropdownButtonFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colour.primaryColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                borderSide: BorderSide(
                                    width: 0.0,
                                    style: BorderStyle.none,
                                    color: Colors.transparent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                    width: 0.0,
                                    style: BorderStyle.none,
                                    color: Colors.transparent),
                              ),
                            ),
                            value: userBatch,
                            onChanged: (newValue) {
                              setState(() {
                                userBatch = newValue;
                              });
                            },
                            items: batch.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(
                                  'Batch ${valueItem.toString()}',
                                  style:
                                      GoogleFonts.lato(color: Colour.lineColor),
                                ),
                              );
                            }).toList(),
                          )
                        : SizedBox(
                            height: 0.0,
                          ),
                    SizedBox(
                      height: screen.vertical(15.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Who is using this ?',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ),
                    DropDownField(
                      textAlignment: TextAlign.start,
                      items: titleOption,
                      value: userTitle,
                      onChanged: (newValue) {
                        setState(() {
                          userTitle = newValue;
                        });
                      },
                    ),
                    SizedBox(
                      height: screen.vertical(50.0),
                    ),
                    Button(
                      'Continue',
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          setState(() {
                            changePage = true;
                          });
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Scaffold emailAndPassword(screen) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(screen.horizontal(4.0)),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: screen.vertical(140.0),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: screen.horizontal(8.0),
                          backgroundColor: Colour.lineColor,
                          child: IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_left,
                              color: Colors.white,
                              size: screen.horizontal(8.0),
                            ),
                            onPressed: () {
                              setState(() {
                                changePage = false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screen.vertical(15.0),
                    ),
                    LatoText(
                      'Just few steps more',
                      size: 32,
                    ),
                    SizedBox(
                      height: screen.vertical(45.0),
                    ),
                    CustomTextField(
                      hintText: 'Email',
                      onChanged: (value) {
                        email = value;
                      },
                      textAlignment: TextAlign.start,
                      keyboard: TextInputType.emailAddress,
                      preffixWidget: Icon(
                        Icons.email_outlined,
                        color: Colour.lineColor,
                      ),
                    ),
                    SizedBox(
                      height: screen.vertical(25.0),
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      textAlignment: TextAlign.start,
                      hideText: true,
                      preffixWidget: Icon(
                        Icons.vpn_key_outlined,
                        color: Colour.lineColor,
                      ),
                      validator: passwordValidator,
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: screen.vertical(25.0),
                    ),
                    CustomTextField(
                      hintText: 'Confirm Password',
                      textAlignment: TextAlign.start,
                      hideText: true,
                      preffixWidget: Icon(
                        Icons.vpn_key_outlined,
                        color: Colour.lineColor,
                      ),
                      validator: (value) =>
                          MatchValidator(errorText: 'Passwords do not match')
                              .validateMatch(value, password),
                    ),
                    SizedBox(
                      height: screen.vertical(50.0),
                    ),
                    Button(
                      'Create Account',
                      onPressed: () async {
                        if (formKey.currentState.validate()) {
                          setState(() {
                            showLoading = true;
                          });
                          try {
                            final newUser = await authentication
                                .createUserInFirebase(email, password);
                            if (newUser != null) {
                              id = FirebaseAuth.instance.currentUser.uid;
                              Account account = Account(
                                  id: id,
                                  username: name,
                                  email: email,
                                  batch: userBatch,
                                  title: userTitle,
                                  isInscoMember: isMember);
                              await authentication.saveDataInFirebase(account);
                              await authentication
                                  .saveDataInLocalStorage(account);
                              debugPrint("All done");
                              //TODO check here
                              Navigator.pushAndRemoveUntil<dynamic>(
                                context,
                                MaterialPageRoute<dynamic>(
                                  builder: (BuildContext context) =>
                                      IntroPage(),
                                ),
                                (route) =>
                                    false, //if you want to disable back feature set to false
                              );
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => HomePage()));

                              setState(() {
                                showLoading = false;
                              });
                            }
                          } catch (e) {
                            print(e.toString());
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: screen.vertical(50.0),
                    ),
                    RailwayText(
                      'Already INSCO member ?',
                      fontColor: Colour.lineColor,
                      size: 14,
                    ),
                    SizedBox(
                      height: screen.vertical(10.0),
                    ),
                    GestureDetector(
                      onTap: () {
                        //TODO implement navigation for login page
                      },
                      child: RailwayText(
                        'LOGIN',
                        fontColor: Colors.white,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    Screen screen = Screen(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('./assets/images/bg.png'),
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
        ),
      ),
      child: ModalProgressHUD(
          inAsyncCall: showLoading,
          child: changePage ? emailAndPassword(screen) : detailPage(screen)),
    );
  }
}
