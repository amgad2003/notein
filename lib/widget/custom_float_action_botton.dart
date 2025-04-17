
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
            backgroundColor: Theme.of(context).primaryColor,
            context: context,
            builder: (context) {
          return  Padding(
            padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(child: AddNote()),
          );
        });
      },
      shape: const CircleBorder(),
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.add,color:Theme.of(context).cardColor,),);
  }
}
