import 'package:flutter/material.dart';

class BuyButton extends StatelessWidget {
  final dynamic price;
  final void Function()? onPressed;

  const BuyButton({
    Key? key,
    required this.price,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Container(
            child: (price is String)
                ? Text('$price')
                : Text('${price.toString()}₺'),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('Buy'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.lightGreen.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
