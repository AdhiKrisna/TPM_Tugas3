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
        title: const Text("Members"),
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
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView( 
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildMemberCard(
                    context,
                    imagePath: 'assets/images/krisna.jpg',
                    name: 'Made Vidyatma Adhi Krisna',
                    nim: '123220038',
                  ),
                  _buildMemberCard(
                    context,
                    imagePath: 'assets/images/samudra.jpg',
                    name: 'Samudera Heriyanto',
                    nim: '123220154',
                  ),
                  _buildMemberCard(
                    context,
                    imagePath: 'assets/images/samudra.jpg',
                    name: 'Nofan Zohrial',
                    nim: '123220023',
                  ),
                  _buildMemberCard(
                    context,
                    imagePath: 'assets/images/samudra.jpg',
                    name: 'Farid Radityo Suherman',
                    nim: '123220094',
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMemberCard(BuildContext context,
      {required String imagePath, required String name, required String nim}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          style: BorderStyle.solid,
          color: Colors.blueGrey,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              imagePath,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '$name\n$nim',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
