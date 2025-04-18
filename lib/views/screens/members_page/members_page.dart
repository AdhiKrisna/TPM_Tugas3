import 'dart:ui';

import 'package:flutter/material.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                style: BorderStyle.solid,
                color: Colors.blueGrey,
              ),
              color: Colors.grey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 5, left: 20, right: 20, bottom: 20),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.375,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.blueGrey,
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withValues(alpha: 0.5)),
                      ]),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.asset(
                           width: 200,
                        height: 200,
                          fit: BoxFit.cover,
                          'assets/images/krisna.jpg',
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Made Vidyatma Adhi Krisna\n123220038',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 5, left: 20, right: 20, bottom: 20),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.375,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.blueGrey,
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withValues(alpha: 0.5)),
                      ]),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.asset(
                        width: 200,
                        height: 200,
                          fit: BoxFit.fill,
                          'assets/images/samudra.jpg',
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Samudera Heriyanto\n123220154',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
