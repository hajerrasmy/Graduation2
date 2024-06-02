import 'package:flutter/material.dart';
import 'package:graduation3/ui/pages/home_pages/home_page.dart';
import 'package:graduation3/ui/pages/location_pages/location_page.dart';
import 'package:graduation3/ui/pages/profile_pages/profile_page.dart';
import 'package:graduation3/ui/pages/task_pages/task_page.dart';

class MainHomePages extends StatefulWidget {
  static const String routeName = "HomePage";


  @override
  _MainHomePagesState createState() => _MainHomePagesState();
}

class _MainHomePagesState extends State<MainHomePages> {
  int currentTab = 0;
  final List<Widget> screens = [
    const HomePage(),
    const TaskPage(),
   const  LocationPage(),
  const   ProfilePage(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8FAFF),
      body: PageStorage(
        child:  currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          //_showAddTaskBottomSheet();
        },
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape:const  CircularNotchedRectangle(),
        notchMargin: 10,
        child:  Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavButton(Icons.home, 0),
              _buildNavButton(Icons.list, 1),
              _buildNavButton(Icons.location_on, 2),
              _buildNavButton(Icons.settings, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton(IconData icon, int tabIndex) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        setState(() {
          currentScreen = screens[tabIndex];
          currentTab = tabIndex;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: currentTab == tabIndex
                ? Theme.of(context).primaryColor
                : Colors.grey,
            size: 38,
          )
        ],
      ),
    );
  }

//  void _showAddTaskBottomSheet() {
//    showModalBottomSheet(
//      context: context,
//      builder: (builderContext) {
//      //  return AddTaskSheet();//     },
//    );
  }

