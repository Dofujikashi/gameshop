import 'package:flutter/material.dart';
import 'package:gameshop/components/balance_card.dart';
import 'package:gameshop/components/primary_button.dart';
import 'package:gameshop/components/text_icon_container.dart';
import 'package:gameshop/entities.dart';
import 'package:gameshop/objectbox.g.dart';
import 'package:gameshop/tools/objectbox_tools.dart';

class AddBalance extends StatelessWidget {
  final User user;
  final Store store;

  const AddBalance({
    Key? key,
    required this.user,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final objT = ObjectboxTools(store: store);
    String balance = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Balance'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BalanceCard(user: user),
            TextIconContainer(
              hintText: 'Enter amount',
              icon: Icons.account_balance_wallet,
              iconColor: Colors.green,
              onChanged: (value) {
                balance = value;
              },
              inputType: const TextInputType.numberWithOptions(decimal: false),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              text: 'Add Balance',
              color: Colors.green,
              onPressed: () {
                if (balance != '' && int.parse(balance) > 0) {
                  objT.addBalance(user, int.parse(balance));
                  Navigator.pop(context, true);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
