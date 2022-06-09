import 'package:flutter/material.dart';

class MyLibraryCard extends StatelessWidget {
  const MyLibraryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.025,
        vertical: 16,
      ),
      color: Colors.grey.shade700,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            ListTile(
              leading: Icon(
                Icons.videogame_asset_rounded,
                color: Colors.red,
                size: 32,
              ),
              title: Text(
                'My Game Library',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
