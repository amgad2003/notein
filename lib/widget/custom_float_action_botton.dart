
import 'package:flutter/material.dart';
import 'custom_add_note.dart';

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
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.add,color:Theme.of(context).cardColor,),);
  }
}
