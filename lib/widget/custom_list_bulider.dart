import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notein0/Cubits/Note_cubits/note_cubit.dart';
import 'package:notein0/Cubits/Note_cubits/note_state.dart';
import 'package:notein0/widget/customText.dart';
import 'custom_add_note.dart';
import 'custom_container_item.dart';
import 'custom_frist_massage.dart';

class CustomListBuilder extends StatelessWidget {
  const CustomListBuilder({super.key});

   @override

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit,NoteState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return Center(child: CircularProgressIndicator(),);
        } else if (state is SuccessState) {
          return Expanded(
              child: SizedBox(
                child: state.listNote.isEmpty
                    ? Center(child: FirstMassageToAddNotes(),)
                    :ListView.builder(
                  itemCount: state.listNote.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: CustomContainerItem(
                        modelNote: state.listNote[index],
                        index: index,),
                    );
                  },),
          ));
        } else {
          return Center(child: CustomText(text: 'No Notes'),);
        }
      },);
  }
}
