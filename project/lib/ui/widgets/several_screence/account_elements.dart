import 'package:flutter/material.dart';

class CardElement extends StatelessWidget {
  const CardElement({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.tab,
  });

  final String text;
  final Icon icon;
  final Color color;
  final VoidCallback tab;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: tab,
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
