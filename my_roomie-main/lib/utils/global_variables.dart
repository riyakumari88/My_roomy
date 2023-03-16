import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_post_screen.dart';
import 'package:flutter_application_1/screens/chat_list.dart';
import 'package:flutter_application_1/screens/chatpage.dart';
import 'package:flutter_application_1/screens/home.dart';
// import 'package:flutter_application_1/screens/feed_screen.dart';
// import 'package:flutter_application_1/screens/profile_screen.dart';
// import 'package:flutter_application_1/screens/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  //const FeedScreen(),
  //const SearchScreen(),
  Home(),
  HomePage(),
  AddPostScreen(),
  Text('profile'),

  //const Text('notifications'),
  // ProfileScreen(
  //   uid: FirebaseAuth.instance.currentUser!.uid,
  // ),
];
