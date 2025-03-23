
import 'package:flutter/material.dart';
import 'package:notein/widget/customText.dart';

class CustomTextField extends StatelessWidget {

  final int maxLine;
  final String labelText;

  const CustomTextField({
    super.key,
    this.maxLine = 1,
    this.labelText = '',
  });

// Decoration Text Field *************

  OutlineInputBorder buildOutlineInputBorder({required  Color color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: color,width: 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      maxLines: maxLine,
        decoration: InputDecoration(
          focusedBorder: buildOutlineInputBorder(color: Colors.greenAccent),
          enabledBorder: buildOutlineInputBorder(color: Colors.white),
          label: CustomText(
            text: labelText,
            color: Colors.greenAccent,
            fontSize: 18,
          )
        ),
      validator: (value) {
        if(value!.isEmpty){
          return 'ادخل نص';
        }else{
          return null;
        }
      },
    );
  }
}
