
import 'package:flutter/material.dart';
import 'package:notein0/widget/custom_float_action_botton.dart';

import 'customText.dart';
import 'custom_add_note.dart';

class FirstMassageToAddNotes extends StatelessWidget {
  const FirstMassageToAddNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomFlatActionButton(),
        const SizedBox(height: 15,),
         CustomText(
          text: "انقر لاضافة الملاحظات ",
          fontFamily: "Poppins",
          color: Theme.of(context).cardColor,
          fontSize: 14,),
      ],
    );
  }
}