import 'package:flutter/material.dart';
import 'package:notein/widget/custom_row_app_bar.dart';
import 'package:notein/widget/custom_text_field.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: CustomAppBarRow(
          onTap: (){},
          icon: Icons.done,
          text: 'Edit Note'),),
      body: Padding(
        padding: const  EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10,),
           // CustomTextField(labelText: 'Title',),
            SizedBox(height: 10,),
            Expanded(
                child: TextField(
                  maxLines: 7,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.blueGrey,width: 1.0),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.blueGrey,width: 1.0),
                    ),
                  )
                )
            )
          ],
        ),
      ),
    );
  }
}