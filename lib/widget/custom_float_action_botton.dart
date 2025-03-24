
import 'package:flutter/material.dart';
import 'package:notein/widget/custom_add_note.dart';

class CustomFlatActionButton extends StatelessWidget {
  const CustomFlatActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            context: context, builder: (context) {
          return const AddNote();
        });
      },
      shape: const CircleBorder(),
      backgroundColor:const Color(0xFF3eb0a0),
      child: const Icon(Icons.add,color: Color(0xFFf2f2f2),),);
  }
}
