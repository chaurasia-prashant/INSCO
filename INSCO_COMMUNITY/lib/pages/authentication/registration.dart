import 'package:INSCO_COMMUNITY/component/drop_down.dart';
import 'package:INSCO_COMMUNITY/component/flatbutton.dart';
import 'package:INSCO_COMMUNITY/component/font_text.dart';
import 'package:INSCO_COMMUNITY/component/text_field.dart';
import 'package:INSCO_COMMUNITY/helper/screen_size.dart';
import 'package:flutter/material.dart';

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
              padding: EdgeInsets.all(screen.horizontal(4)),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: screen.vertical(10),
                  ),
                  LatoText(
                    "Let's integrate with INSCO Community",
                    size: 15,
                  ),
                  SizedBox(
                    height: screen.vertical(45),
                  ),
                  CustomTextField(
                    hintText: 'Your Name',
                    textAlignment: TextAlign.start,
                    keyboard: TextInputType.name,
                  ),
                  SizedBox(
                    height: screen.vertical(25),
                  ),
                  Row(
                    children: [
                      Text('Are you a pre student of INSCO?'),
                      Switch(
                        value: isMember,
                        onChanged: (value) {
                          setState(() {
                            isMember = value;
                          });
                        },
                        activeTrackColor: Colors.blue,
                        activeColor: Colors.blue[900],
                      ),
                    ],
                  ),
                  isMember
                      ? DropDownField(
                          hintText: 'Select your batch',
                          textAlignment: TextAlign.start,
                          items: batch.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5.0),
                                child: Text('Batch ${valueItem.toString()}'),
                              ),
                            );
                          }).toList(),
                          value: userBatch.toString(),
                          onChanged: (newValue) {
                            setState(() {
                              userBatch = newValue;
                            });
                          },
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  DropDownField(
                    hintText: 'Who is using this?',
                    textAlignment: TextAlign.start,
                    items: titleOption.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: Text(valueItem),
                        ),
                      );
                    }).toList(),
                    value: userTitle,
                    onChanged: (newValue) {
                      setState(() {
                        userTitle = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: screen.vertical(25),
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
              padding: EdgeInsets.all(screen.horizontal(4)),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: screen.vertical(150),
                  ),
                  LatoText(
                    'Just fef steps',
                    size: 15,
                  ),
                  SizedBox(
                    height: screen.vertical(45),
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
                    height: screen.vertical(25),
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
                    height: screen.vertical(25),
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
                    height: screen.vertical(25),
                  ),
                  Button(
                    'Create Account',
                    onPressed: () {
                      debugPrint('Login');
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
      child: isMember ? emailAndPassword(screen) : detailPage(screen),
    );
  }
}
