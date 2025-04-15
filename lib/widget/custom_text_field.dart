
import 'package:flutter/material.dart';
import 'customText.dart';

class CustomTextField extends StatelessWidget {

  final int maxLine;
  final String labelText;
  final void Function(String?)? onSaved;

  const CustomTextField({
    super.key,
    this.maxLine = 1,
    this.labelText = '',
    this.onSaved,
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
    return  TextFormField(
      style:  TextStyle(
          color: Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.black
      ),
      maxLines: maxLine,
        decoration:  InputDecoration(
          focusedBorder: buildOutlineInputBorder(color: Colors.blueGrey),
          enabledBorder: buildOutlineInputBorder(color:  Colors.blueGrey),
          border: buildOutlineInputBorder(color: Colors.blueGrey),
          label:  CustomText(
            text: labelText,
            color: Colors.greenAccent,
            fontSize: 18,
          )
        ),
      validator: (value) {
        if(value?.isEmpty ?? true){
          return 'ادخل نص';
        }else{
          return null;
        }
      },
      onSaved: onSaved,

    );
  }
}
