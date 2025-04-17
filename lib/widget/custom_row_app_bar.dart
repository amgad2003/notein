import 'package:flutter/material.dart';
import 'customText.dart';

class CustomAppBarRow extends StatelessWidget {

   final IconData icon;
   final String text;
   final void Function()? onTap;

   const CustomAppBarRow({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
            text: text,
            fontSize: 28,
            fontFamily: "Poppins",

            color: Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.black
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black38,blurRadius: 3,offset: Offset(2, 5))],
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).cardColor,
              size: 25,
            ),
          ),
        )
      ],
    );
  }
}

