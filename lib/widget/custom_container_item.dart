
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notein0/Cubits/Note_cubits/note_cubit.dart';
import 'package:notein0/Model/model_note.dart';
import 'package:page_transition/page_transition.dart';
import '../View/edit_view.dart';
import 'customText.dart';

class CustomContainerItem extends StatelessWidget {
 final ModelNote modelNote;
 final int index;


    const CustomContainerItem({
    super.key,
    required this.modelNote,
     required this.index,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(type: PageTransitionType.bottomToTop,
            child: EditView(index: index,note: modelNote,)));
      },
      child: Container(
        padding: EdgeInsets.only(top: 24,bottom: 24,left: 16),
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(18)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: CustomText(
                    text: modelNote.title,
                    fontSize: 26),
              ),
              subtitle: CustomText(
                text: modelNote.subTitle,
                maxLine: null,
                fontSize: 16,
                color: Colors.black.withOpacity(0.4),
              ),
              trailing:IconButton(
                onPressed: (){},
                icon:  IconButton(
                  onPressed: () {
                    context.read<NoteCubit>().deleteNote(index);
<<<<<<< HEAD
                    context.read<NoteCubit>().getNote();
=======
>>>>>>> 1bf05e125ccd873659776303139dfc2e55cc50b9
                  },
                  icon: Icon(Icons.delete,size: 32),color: Colors.black,),
                color: Colors.black,
                ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                      text: modelNote.date,
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.4)),
                    IconButton(
                      icon: Icon(
                        modelNote.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: modelNote.isFavorite
                            ? Colors.black54
                            : Colors.black54,
                        size: 25,
                      ),
                      onPressed: () {
                        context.read<NoteCubit>().toggleFavorite(index);
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
