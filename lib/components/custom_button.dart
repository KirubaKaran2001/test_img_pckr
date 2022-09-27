import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final VoidCallback? onclick;

  const CustomButton({
    required this.onclick,
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onclick!,
      child: Row(
        children: [
          Icon(icon!),
          const SizedBox(height: 15),
          Text(text!),
        ],
      ),
    );
  }
}
