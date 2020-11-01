import 'package:flutter/material.dart';
import 'package:readathon/src/pages/home_page.dart';
import 'package:readathon/src/pages/subjects_page.dart';
import 'package:readathon/src/pages/profile_page.dart';
import 'package:readathon/src/pages/videos_page.dart';


class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages;
  Widget currentPage;
  int currentTabIndex = 0;
  HomePage homePage;
  SubjectsPage subjectsPage;
  ProfilePage profilePage;
  VideosPage videosPage;

  @override
  void initState() {
    homePage = HomePage();
    subjectsPage = SubjectsPage();
    profilePage = ProfilePage();
    videosPage = VideosPage();

    pages = [homePage, videosPage, subjectsPage, profilePage];
    currentPage = homePage;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Ubuntu",
            
          ),
        ),
        leading: IconButton(
          alignment:Alignment.center,
            icon: Image.asset('assets/images/e-funza-small.png'), 
            onPressed: () { },
          ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: "Videos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Subjects",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: "Profile",
          ),
        ],
      ),
      body: currentPage,
    );    
  }
}