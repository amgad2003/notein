import 'package:flutter/cupertino.dart';
class CustomText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? fontSize;
  final String? fontFamily;
  final  FontWeight? fontWeight;
  final TextOverflow? overFlow;
  final int? maxLine;

  const CustomText({
    super.key,
    this.color,
    required this.text,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.overFlow,
    this.maxLine
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }

}