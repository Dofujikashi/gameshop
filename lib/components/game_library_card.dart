import 'package:flutter/material.dart';
import 'package:gameshop/entities.dart';

class GameLibraryCard extends StatelessWidget {
  final Game game;

  const GameLibraryCard({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: Colors.grey.shade700,
      elevation: 16,
      margin:
          EdgeInsets.fromLTRB(size.width * 0.025, 0, size.width * 0.025, 16),
      child: Column(
        children: [
          Image(image: MemoryImage(game.image)),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    game.name,
                    style: const TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
