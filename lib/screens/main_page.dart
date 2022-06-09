import 'package:flutter/material.dart';
import 'package:gameshop/components/game_library_card.dart';
import 'package:gameshop/components/my_library_card.dart';
import 'package:gameshop/components/profile_card.dart';
import 'package:gameshop/entities.dart';
import 'package:gameshop/objectbox.g.dart';
import 'package:gameshop/screens/add_balance.dart';
import 'package:gameshop/screens/marketplace.dart';
import '../components/primary_button.dart';

class MainPage extends StatefulWidget {
  final User user;
  final Store store;

  const MainPage({
    Key? key,
    required this.user,
    required this.store,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileCard(user: widget.user),
              PrimaryButton(
                text: 'Add Balance',
                onPressed: () async {
                  bool? isChanged = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return AddBalance(user: widget.user, store: widget.store);
                  }));
                  if (isChanged != null) {
                    setState(() {
                      widget.user.balance;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                text: 'Go to Marketplace',
                onPressed: () async {
                  bool? havePurchase = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return Marketplace(
                      user: widget.user,
                      store: widget.store,
                    );
                  }));

                  if (havePurchase != null) {
                    setState(() {
                      widget.user;
                    });
                  }
                },
              ),
              const MyLibraryCard(),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.user.games.length,
                itemBuilder: (BuildContext context, int index) {
                  return GameLibraryCard(
                    game: widget.user.games.elementAt(index),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
