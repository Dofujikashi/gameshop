import 'package:flutter/material.dart';
import 'package:gameshop/components/primary_button.dart';
import 'package:gameshop/components/text_icon_container.dart';
import 'package:gameshop/objectbox.g.dart';
import 'package:gameshop/tools/objectbox_tools.dart';

class InsertGame extends StatefulWidget {
  final Store store;
  const InsertGame({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  State<InsertGame> createState() => _InsertGameState();
}

class _InsertGameState extends State<InsertGame> {
  String name = '';
  String price = '';
  String releaseDate = '';
  String imageName = '';

  @override
  Widget build(BuildContext context) {
    final objT = ObjectboxTools(store: widget.store);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert new Game'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextIconContainer(
              hintText: 'Name',
              icon: Icons.abc,
              onChanged: (text) {
                name = text;
              },
              inputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            TextIconContainer(
              hintText: 'Price',
              icon: Icons.price_change,
              onChanged: (text) {
                price = text;
              },
              inputType: const TextInputType.numberWithOptions(decimal: false),
            ),
            const SizedBox(height: 16),
            TextIconContainer(
              hintText: 'Release Date',
              icon: Icons.date_range,
              onChanged: (text) {
                releaseDate = text;
              },
              inputType: TextInputType.datetime,
            ),
            const SizedBox(height: 16),
            TextIconContainer(
              hintText: 'Image Name',
              icon: Icons.image,
              onChanged: (text) {
                imageName = text;
              },
              inputType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              text: 'Add Game',
              onPressed: () {
                if (name != '') {
                  objT.insertGame(name, int.parse(price),
                      DateTime.parse(releaseDate), imageName);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
