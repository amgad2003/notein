
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notein0/Cubits/Note_cubits/note_cubit.dart';
import 'package:notein0/Cubits/Note_cubits/note_state.dart';
import 'package:notein0/Model/model_note.dart';
import 'package:notein0/widget/customText.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

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
    return BlocConsumer<NoteCubit,NoteState>(
        listener: (context, state) {
          if(state is SuccessState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: CustomText(text: 'Done 😉',color: Theme.of(context).cardColor,),
              backgroundColor: Theme.of(context).primaryColor,

            ));
          }else if(state is FailureState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomText(text: 'error is ${(state.erorrMessage)}',color: Colors.black ,),backgroundColor: Colors.red,));
          }
        },
      builder: (context, state) {
        return SizedBox(
          child: Padding(
            padding: const  EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: Column(
                children: [
                  const SizedBox(height: 80,),
                  CustomTextField(
                      labelText: 'Title',
                      onSaved: (p0) {
                        title = p0;
                      }),
                  const SizedBox(height: 15,),
                  CustomTextField(
                    maxLine: 7,
                    labelText: 'Content',
                    onSaved: (p0) {
                      subTitle = p0;
                    },),
                  const SizedBox(height: 15),
                  CustomButton(
                    onTap: () {
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        final note = ModelNote(
                            title: title!,
                            subTitle: subTitle!,
                            date: DateTime.now().toString(),
                            color: 0);
                        context.read<NoteCubit>().addNote(note);
                        Navigator.pop(context);
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
      },);
  }
}
