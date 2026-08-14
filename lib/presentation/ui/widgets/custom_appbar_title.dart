
import 'package:elan/core/styles.dart';
import 'package:flutter/material.dart';

class CustomAppbarTitle extends StatelessWidget {
  const CustomAppbarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Hello!",
                  style: ibmPlexSerifBSStyle(color:Colors.black),
                ),
                Text(
                  "Shaun Hossain",
                  style: ibmPlexSerifBMStyle(color:Colors.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
