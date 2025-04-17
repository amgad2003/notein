import 'package:flutter/material.dart';
import 'customText.dart';

class CustomTextFieldTitle extends StatelessWidget {
  const CustomTextFieldTitle({
    super.key,
    required this.title,
    required this.enabeledBorder,
    required this.focuseedBorder,
    required this.color,
  });

  final TextEditingController title;
  final InputBorder enabeledBorder;
  final InputBorder focuseedBorder;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller:  title ,
        style: TextStyle(color: Theme.of(context).appBarTheme.titleTextStyle!.color??Colors.white),
        decoration: InputDecoration(
            label: CustomText(
              text: "العنوان",
              color: color,),
            enabledBorder: enabeledBorder,
            focusedBorder: focuseedBorder
        )
    );
  }
}