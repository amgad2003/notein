
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
            backgroundColor: Color(0xFF2c2c2c),
            context: context, builder: (context) {
          return AddNote();
        });
      },
      shape: CircleBorder(),
      backgroundColor: Color(0xFF3eb0a0),
      child: Icon(Icons.add,),);
  }
}
