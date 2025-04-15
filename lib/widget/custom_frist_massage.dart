
import 'package:flutter/material.dart';

import 'customText.dart';
import 'custom_add_note.dart';

class FirstMassageToAddNotes extends StatelessWidget {
  const FirstMassageToAddNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              context: context, builder: (context) {
            return const AddNote();
          });
        },
        child: CustomText(
          text: "Enter To Add Notes",
          color: Theme.of(context).cardColor,
          fontSize: 14,));
  }
}