import 'package:flutter/material.dart';

class TextIconContainer extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final void Function(String value) onChanged;
  final TextInputType inputType;
  final Color? iconColor;

  const TextIconContainer({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.inputType,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        keyboardType: inputType,
        onChanged: onChanged,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            icon,
            color: iconColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
