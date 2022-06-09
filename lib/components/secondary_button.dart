import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const SecondaryButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 48,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade800),
          side: MaterialStateProperty.all(
            const BorderSide(color: Colors.blue, width: 2),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
