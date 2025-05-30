
import 'package:flutter/material.dart';
import 'customText.dart';
import 'custom_button.dart';

class CustomAddRemind extends StatefulWidget {
  const CustomAddRemind({
    super.key,
  });

  @override
  State<CustomAddRemind> createState() => _CustomAddRemindState();
}

class _CustomAddRemindState extends State<CustomAddRemind> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 22),
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(22))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
            ),
          )),
    );
  }
}
