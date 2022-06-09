import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? color;

  const PrimaryButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 48,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
