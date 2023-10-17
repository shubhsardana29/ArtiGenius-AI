import 'package:artigeniusai/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class ArtScreen extends StatefulWidget {
  ArtScreen({Key? key}) : super(key: key);

  @override
  State<ArtScreen> createState() => _ArtScreenState();
}

class _ArtScreenState extends State<ArtScreen> {
  List<String> imageUrls = []; // Store the image URLs

  @override
  void initState() {
    super.initState();
    // Fetch the image URLs when the screen loads
    fetchImageUrls();
  }

  Future<void> fetchImageUrls() async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId != null) {
        // Query Firestore to get image URLs associated with the current user
        final querySnapshot = await FirebaseFirestore.instance
            .collection('images')
            .where('userId', isEqualTo: userId)
            .get();

        final urls = querySnapshot.docs
            .map((doc) => doc['imageUrl'].toString())
            .toList();

        // Update the state with the fetched image URLs
        setState(() {
          imageUrls = urls;
        });
      }
    } catch (e) {
      print('Error fetching image URLs: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My Saved Art',
          style: TextStyle(
            color: whiteColor,
            fontSize: 20,
            fontFamily: "poppins_bold",
          ),
        ),
        actions: [
          ElevatedButton.icon(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(8),
              backgroundColor: btnColor,
            ),
            label: Text("Logout"),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Image.network(imageUrls[index]);
        },
      ),
    );
  }
}
