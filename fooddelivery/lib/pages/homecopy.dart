import 'package:flutter/material.dart';

class Homecopy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add your onPressed logic here
              },
              child: Text('Admin Login'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your onPressed logic here
              },
              child: Text('Customer Login'),
            ),
          ],
        ),
      ),
    );
  }
}
