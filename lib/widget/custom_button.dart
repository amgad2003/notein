
import 'package:flutter/material.dart';
import 'customText.dart';

class CustomButton extends StatelessWidget {

 final void Function() onTap ;
 final String text;
 final Color color;
 const CustomButton({
    super.key,
   required this.onTap,
   required this.text,
   required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ,
      child:  Container(
          alignment: Alignment.center,
          margin:const  EdgeInsets.all(5),
          height: 55,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8)
          ),
          child: CustomText(
            text: text,
            fontSize: 22,
            fontWeight: FontWeight.w700,)
      ),
    );
  }
}
