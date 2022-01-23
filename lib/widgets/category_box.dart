import 'package:fintech_dashboard_clone/styles/styles.dart';
import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  final List<Widget> children;
  final Widget suffix;
  final String title;

  const CategoryBox({
    Key? key,
    required this.suffix,
    required this.children,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: Styles.defaultBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(Styles.defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                suffix
              ],
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
