import 'package:INSCO_COMMUNITY/component/drop_down.dart';
import 'package:INSCO_COMMUNITY/component/flatbutton.dart';
import 'package:INSCO_COMMUNITY/component/font_text.dart';
import 'package:INSCO_COMMUNITY/component/text_field.dart';
import 'package:INSCO_COMMUNITY/helper/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  void initState() {
    super.initState();
    arr();
  }

  bool isMember = false;
  bool changePage = false;
  String userTitle = 'User';
  int userBatch = 2018;
  List batch = [];
  List titleOption = ['HOD', 'Former HOD', 'Teacher', 'Student', 'User'];
  void arr() {
    for (int i = 1974; i <= DateTime.now().year; i++) {
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
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(screen.horizontal(4.0)),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: screen.vertical(10.0),
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
                  ),
                  SizedBox(
                    height: screen.vertical(25.0),
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
                                color: Colors.grey),
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
                        inactiveTrackColor: Colors.grey,
                        activeTrackColor: Colors.blue,
                        activeColor: Colors.blue[900],
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
                  ) : SizedBox(height:0.0),
                  isMember
                      ? DropdownButtonFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black,
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
                                style: GoogleFonts.lato(color: Colors.grey),
                              ),
                            );
                          }).toList(),
                        )
                      : SizedBox(
                          height: 0.0,
                        ),
                  SizedBox(
                    height: screen.vertical(25.0),
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
                    height: screen.vertical(25.0),
                  ),
                  Button(
                    'Continue',
                    onPressed: () {
                      setState(() {
                        changePage = true;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
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
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(screen.horizontal(4.0)),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: screen.vertical(150.0),
                  ),
                  LatoText(
                    'Just few steps more',
                    size: 25,
                  ),
                  SizedBox(
                    height: screen.vertical(45.0),
                  ),
                  CustomTextField(
                    hintText: 'Email',
                    textAlignment: TextAlign.start,
                    keyboard: TextInputType.emailAddress,
                    preffixWidget: Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
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
                      color: Colors.grey,
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
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: screen.vertical(25.0),
                  ),
                  Row(
                    children: [
                      Button(
                        'Go Back',
                        onPressed: () {
                          setState(() {
                            changePage = false;
                          });
                        },
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Button(
                          'Create Account',
                          onPressed: () {
                            debugPrint('Login');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Screen screen = Screen(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('./assets/images/authenticate_bg.png'),
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
        ),
      ),
      child: changePage ? emailAndPassword(screen) : detailPage(screen),
    );
  }
}
