import 'package:flutter/material.dart';
import 'package:readathon/src/pages/home_page.dart';
import 'package:readathon/src/pages/subjects_page.dart';
import 'package:readathon/src/pages/settings_page.dart';
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
  SettingsPage settingsPage;
  VideosPage videosPage;

  @override
  void initState() {
    homePage = HomePage();
    subjectsPage = SubjectsPage();
    settingsPage = SettingsPage();
    videosPage = VideosPage();

    pages = [homePage, videosPage, subjectsPage, settingsPage];
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
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            title: Text("Videos"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text("Subjects"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
          ),
        ],
      ),
      body: currentPage,
    );    
  }
}