
import 'package:flutter/material.dart';
import 'customText.dart';

class CustomButton extends StatelessWidget {

 final void Function() onTap ;

 const CustomButton({
    super.key,
   required this.onTap,
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
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(8)
          ),
          child:const CustomText(text: 'Add',fontSize: 22,fontWeight: FontWeight.w700,)
      ),
    );
  }
}
