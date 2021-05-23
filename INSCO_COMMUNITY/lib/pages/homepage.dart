
import 'package:flutter/material.dart';
import 'package:INSCO_COMMUNITY/pages/home_screen_pages/main_screen.dart';
import 'package:INSCO_COMMUNITY/pages/home_screen_pages/profile.dart';
import 'package:INSCO_COMMUNITY/pages/home_screen_pages/search.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.jumpToPage(
      pageIndex,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          MainScreen(),
          SearchScreen(),
          ProfileScreen(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: onTap,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[500],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }
}





// Container(
//       child: GestureDetector(
//           onTap: () async {
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
//                 MaterialPageRoute(builder: (context) => WelcomePage()));
//           },
//           child: Text('Home Page')),
//     );
//   }
// }






