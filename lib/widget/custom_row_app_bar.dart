import 'package:flutter/material.dart';
import 'package:notein/widget/customText.dart';

class CustomAppBarRow extends StatelessWidget {

  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const CustomAppBarRow({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: text,
          fontSize: 32,
          color: Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.black
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Icon(
              icon,
              color: Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.black,
              size: 25,
            ),
          ),
        )
      ],
    );
  }
}

