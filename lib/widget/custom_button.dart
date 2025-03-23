
import 'package:flutter/material.dart';
import 'package:notein/widget/customText.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        //margin: EdgeInsets.all(5),
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(8)
        ),
        child: CustomText(text: 'Add',fontSize: 22,fontWeight: FontWeight.w700,)
    );
  }
}
