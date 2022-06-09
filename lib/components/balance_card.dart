import 'package:flutter/material.dart';
import 'package:gameshop/entities.dart';

class BalanceCard extends StatelessWidget {
  final User user;

  const BalanceCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: 16,
      ),
      color: Colors.grey.shade700,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(
                Icons.account_balance,
                color: Colors.green,
                size: 32,
              ),
              title: Text('Current Balance: ${user.balance}₺'),
            ),
          ],
        ),
      ),
    );
  }
}
