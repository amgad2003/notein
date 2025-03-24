
import 'package:flutter/material.dart';
import 'package:notein/widget/custom_button.dart';
import 'package:notein/widget/custom_text_field.dart';

class AddNote extends StatefulWidget {
  const AddNote({
    super.key,
  });

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  String? title ;
  String? subTitle;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const  EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              SizedBox(height: 30,),
              CustomTextField(
                labelText: 'Title',
                onSaved: (p0) {
                  title = p0;
                },),
              SizedBox(height: 15,),
              CustomTextField(
                maxLine: 7,
                labelText: 'Content',
                onSaved: (p0) {
                  subTitle = p0;
                },),
              SizedBox(height: 15),
              CustomButton(
                onTap: () {
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                  }else{
                    autoValidateMode =AutovalidateMode.always ;
                    setState(() {

                    });
                  }
                },),
            ],
          ),
        ),
      ),
    );
  }
}
