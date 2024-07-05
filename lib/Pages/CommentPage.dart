import 'package:flutter/material.dart';

class CommentPage extends StatelessWidget {
  final String imagePath;

  const CommentPage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 300,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Add your comment...",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement comment submission logic
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}