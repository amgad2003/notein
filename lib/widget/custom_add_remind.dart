
import 'package:flutter/material.dart';
import 'customText.dart';
import 'custom_button.dart';

class CustomAddRemind extends StatelessWidget {
  const CustomAddRemind({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                CustomText(
                  text: "تعيين التاريخ والوقت",
                  fontSize: 18,
                  color: Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.black,),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: CustomButton(
                          onTap: () {},
                          text: "حسنّا",
                          color: Colors.greenAccent),
                    ),
                    Flexible(
                      child: CustomButton(
                          onTap: () {},
                          text: "الغاء",
                          color: Colors.grey.shade600),
                    )
                  ],
                ),
                SizedBox( height: 20,)
              ],
            )));
  }
}
