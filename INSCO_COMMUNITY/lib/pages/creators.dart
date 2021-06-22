import 'package:INSCO_COMMUNITY/constants/color.dart';
import 'package:INSCO_COMMUNITY/pages/homepage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatorPage extends StatefulWidget {
  @override
  _CreatorPageState createState() => _CreatorPageState();
}

class _CreatorPageState extends State<CreatorPage> {
  getCreatorPhoto() {
    if (staticData.creatorPhoto == "" || staticData.creatorPhoto == null) {
      return AssetImage('./assets/images/avtar.png');
    }else {
      return CachedNetworkImageProvider(staticData.creatorPhoto);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colour.buttonColor,
          title: Text('Creators'),
        ),
        backgroundColor: Colour.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: CircleAvatar(
                  radius: 70.0,
                  backgroundColor: Colour.greyLight,
                  backgroundImage: getCreatorPhoto(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                child: Material(
                  color: Colour.greyLight,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: Text(
                          'Prashant Kumar Chaurasia',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                        SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Batch',
                              style:
                                  GoogleFonts.lato(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 60.0,
                            ),
                            Text('2018-2021')
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Work Area',
                              style:
                                  GoogleFonts.lato(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                                'Python\nApp development\nGraphic Designer\nInstrumentation')
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Contact',
                              style:
                                  GoogleFonts.lato(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 50.0,
                            ),
                            Text('8005089340')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                child: Material(
                  color: Colour.greyLight,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                            'I am very glad to be a part of INSCO COMMUNITY. I join Insco society in 2018.'),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                            'I dreamt to develop a platform where we all Insco members can integrate and help each other and I am very happy that I am successed to build this app'),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                            'I am thankful for my friends and classmate to help collecting all the data which help students joining our society'),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              // CMembers(),
              // SizedBox(
              //   height: 20.0,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CMembers extends StatelessWidget {
//   const CMembers({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       child: Material(
//         color: Colour.greyLight,
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                 child: Column(
//                   children: [
//                     Center(
//                       child: CircleAvatar(
//                         radius: 30.0,
//                         backgroundColor: Colour.primaryColor,
//                         backgroundImage:
//                             AssetImage('./assets/images/avtar.png'),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Center(
//                         child: Text(
//                       'Siddharth Shukla',
//                       style: GoogleFonts.lato(fontSize: 10.0),
//                     )),
//                   ],
//                 ),
//               ),
//               Container(
//                 child: Column(
//                   children: [
//                     Center(
//                       child: CircleAvatar(
//                         radius: 30.0,
//                         backgroundColor: Colour.primaryColor,
//                         backgroundImage:
//                             AssetImage('./assets/images/avtar.png'),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Center(
//                       child: Text(
//                         'Shubhranshu Srivastava',
//                         style: GoogleFonts.lato(fontSize: 10.0),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 child: Column(
//                   children: [
//                     Center(
//                       child: CircleAvatar(
//                         radius: 30.0,
//                         backgroundColor: Colour.primaryColor,
//                         backgroundImage:
//                             AssetImage('./assets/images/avtar.png'),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Center(
//                         child: Text(
//                       'Vikash Mishra',
//                       style: GoogleFonts.lato(fontSize: 10.0),
//                     )),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
