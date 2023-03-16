import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/global_variables.dart';

class NextPage extends StatelessWidget {
  final snap;
  const NextPage({
    Key? key,
    required this.snap,
  }) : super(key: key);
  // List data = [
  @override
  Widget build(BuildContext context) {
    return Container(
      // boundary needed for web
      decoration: BoxDecoration(
          border: Border.all(
            color: primaryColor,
          ),
          color: primaryColor,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(children: [
        // HEADER SECTION OF THE POST
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 16,
          ).copyWith(right: 0),
          child: Row(
            children: <Widget>[],
          ),
        ),
        // IMAGE SECTION OF THE POST
        GestureDetector(
          //onDoubleTap: () {
          //   FireStoreMethods().likePost(
          //     widget.snap['postId'].toString(),
          //     user.uid,
          //     widget.snap['likes'],
          //   );
          //   setState(() {
          //     isLikeAnimating = true;
          //   });
          // },
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                child: Image.network(
                  snap['postUrl'],
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 240, left: 330),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      useRootNavigator: false,
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: ListView(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shrinkWrap: true,
                              children: [
                                'Delete',
                              ]
                                  .map(
                                    (e) => InkWell(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 16),
                                          child: Text(e),
                                        ),
                                        onTap: () {
                                          // deletePost(
                                          //   widget.snap['postId']
                                          //       .toString(),
                                          // );
                                          // remove the dialog box
                                          Navigator.of(context).pop();
                                        }),
                                  )
                                  .toList()),
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: Color.fromARGB(255, 113, 114, 114),
                    size: 27,
                  ),
                ),
              )
              // AnimatedOpacity(
              //   duration: const Duration(milliseconds: 200),
              //   opacity: isLikeAnimating ? 1 : 0,
              //   child: LikeAnimation(
              //     isAnimating: isLikeAnimating,
              //     child: const Icon(
              //       Icons.favorite,
              //       color: Colors.white,
              //       size: 100,
              //     ),
              //     duration: const Duration(
              //       milliseconds: 400,
              //     ),
              //     onEnd: () {
              //       setState(() {
              //         isLikeAnimating = false;
              //       });
              //     },
              //   ),
              // ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                    snap['profImage'],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    snap['username'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 125),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 60,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 10, 10, 10),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
