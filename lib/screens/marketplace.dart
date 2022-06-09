import 'package:flutter/material.dart';
import 'package:gameshop/components/game_card.dart';
import 'package:gameshop/entities.dart';
import 'package:gameshop/objectbox.g.dart';
import 'package:gameshop/tools/objectbox_tools.dart';

class Marketplace extends StatefulWidget {
  final User user;
  final Store store;

  const Marketplace({Key? key, required this.user, required this.store})
      : super(key: key);

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  @override
  Widget build(BuildContext context) {
    final objT = ObjectboxTools(store: widget.store);
    List<Game> gameList = objT.getAllGames().cast();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Text(
                "Games",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: gameList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GameCard(
                    game: gameList.elementAt(index),
                    onPressed: () {
                      final game = gameList.elementAt(index);
                      bool hasOwned = false;

                      for (var element in widget.user.games) {
                        if (element.id == game.id) {
                          hasOwned = true;
                          break;
                        }
                      }

                      if (hasOwned) {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            backgroundColor: Colors.grey.shade900,
                            title: const Text('Game Already Owned'),
                            content: const Text('You already own this game.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            backgroundColor: Colors.grey.shade900,
                            title: Text('Buy ${game.name}'),
                            content: const Text('Are you sure?'),
                            actions: [
                              TextButton(
                                child: const Text('No'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              TextButton(
                                child: const Text('Yes'),
                                onPressed: () {
                                  if (widget.user.balance >= game.price) {
                                    widget.user.balance -= game.price;
                                    widget.user.games
                                        .add(gameList.elementAt(index));
                                    objT.userBox.put(widget.user);
                                    setState(() {
                                      widget.user;
                                    });
                                    Navigator.pop(context);
                                    Navigator.pop(context, true);
                                  } else {
                                    Navigator.pop(context);
                                    showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        backgroundColor: Colors.grey.shade900,
                                        title:
                                            const Text('Insufficient balance'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
