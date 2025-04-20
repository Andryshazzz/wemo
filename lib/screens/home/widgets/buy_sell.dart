import 'package:flutter/material.dart';

class BuySellWidget extends StatelessWidget {
  const BuySellWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: _Button(text: 'Buy', icon: Icons.arrow_circle_up)),
        SizedBox(width: 6),
        Expanded(child: _Button(text: 'Sell', icon: Icons.arrow_circle_down)),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  final String text;
  final IconData icon;

  const _Button({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: InkWell(
        onTap: () {},
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 52),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Color(0xffFEFEFE)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(text), Icon(icon)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
