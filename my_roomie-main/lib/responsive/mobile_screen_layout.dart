import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart' as model;
import 'package:flutter_application_1/provider/user_provider.dart';
import 'package:flutter_application_1/utils/global_variables.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  _MobileScreenLayoutState createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  // String username = "";
  // @override
  // void initState() {
  //   super.initState();
  //   getUsername();
  // }

  // void getUsername() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get();
  //   setState(() {
  //     username = (snap.data() as Map<String, dynamic>)["username"];
  //   });
  // }
  int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Icon(
                Icons.other_houses_rounded,
                color: _page == 0
                    ? Color.fromARGB(255, 29, 28, 28)
                    : Color.fromARGB(255, 248, 246, 246),
              ),
            ),
            label: '',
            //  backgroundColor: Color.fromRGBO(0, 0, 255, 60)
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(
                Icons.messenger_outline_rounded,
                color: _page == 1
                    ? Colors.black
                    : Color.fromARGB(255, 248, 246, 246),
              ),
            ),
            label: '',
            // backgroundColor: Color.fromRGBO(0, 0, 255, 60)
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(
                Icons.upload_file_rounded,
                color: _page == 2
                    ? Color.fromARGB(255, 17, 16, 16)
                    : Color.fromARGB(255, 248, 246, 246),
              ),
            ),
            label: '',
            // backgroundColor: Color.fromRGBO(0, 0, 255, 60)
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(
                Icons.person,
                color: _page == 3
                    ? Color.fromARGB(255, 17, 16, 16)
                    : Color.fromARGB(255, 248, 246, 246),
              ),
            ),
            label: '',
            //backgroundColor: Color.fromRGBO(0, 0, 255, 60)
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
