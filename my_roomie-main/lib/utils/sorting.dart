import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Sorting extends StatefulWidget {
  const Sorting({Key? key}) : super(key: key);

  @override
  State<Sorting> createState() => _SortingState();
}

class _SortingState extends State<Sorting> {
  String username = "";
  int count = 0;

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      username = (snap.data() as Map<String, dynamic>)["username"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(username)),
    );
  }
}
