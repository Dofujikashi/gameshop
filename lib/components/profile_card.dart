import 'package:flutter/material.dart';
import 'package:gameshop/entities.dart';

class ProfileCard extends StatelessWidget {
  final User user;
  const ProfileCard({
    Key? key,
    required this.user,
  }) : super(key: key);

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back, ${user.userName}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.account_balance,
                  color: Colors.green,
                  size: 32,
                ),
                const SizedBox(width: 16),
                Text(
                  'Your balance: ${user.balance}₺',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
