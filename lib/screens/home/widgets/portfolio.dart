import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PortfolioWidget extends StatelessWidget {
  const PortfolioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: InkWell(
        onTap: () {},
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 200, maxWidth: double.infinity),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Color(0xffFEFEFE)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('balance'),
                  Spacer(),
                  Text('22 312.32', style: TextStyle(fontSize: 30),)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
