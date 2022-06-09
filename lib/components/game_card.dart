import 'package:flutter/material.dart';
import 'package:gameshop/entities.dart';
import 'buy_button.dart';

class GameCard extends StatelessWidget {
  final Game game;
  final void Function()? onPressed;

  const GameCard({
    Key? key,
    required this.game,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: Colors.grey.shade700,
      elevation: 16,
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.025,
        vertical: 16,
      ),
      child: Column(
        children: [
          Image(image: MemoryImage(game.image)),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                    'Release Date: ${game.releaseDate.day}/${game.releaseDate.month}/${game.releaseDate.year}'),
              ],
            ),
          ),
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
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                BuyButton(
                  price: (game.price == 0) ? 'Free' : game.price,
                  onPressed: onPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
