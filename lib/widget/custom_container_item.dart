
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notein0/Cubits/Favorite_Cubit/favorite_cubit.dart';
import 'package:notein0/Cubits/Note_cubits/note_cubit.dart';
import 'package:notein0/Model/model_note.dart';
import 'package:page_transition/page_transition.dart';
import '../View/edit_view.dart';
import 'customText.dart';

class CustomContainerItem extends StatefulWidget {
 final ModelNote modelNote;
 final int index;


    const CustomContainerItem({
    super.key,
    required this.modelNote,
     required this.index,

  });

  @override
  State<CustomContainerItem> createState() => _CustomContainerItemState();
}

class _CustomContainerItemState extends State<CustomContainerItem> {

  bool isPressed = false ;
  Offset tapPosition = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isPressed
          ?0.9
          :1.0,
      duration: Duration(milliseconds: 100),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(type: PageTransitionType.bottomToTop,
              child: EditView(index: widget.index,note: widget.modelNote,)));
        },
          onLongPress: () async {
            final selected = await showMenu(
              context: context,
              position: RelativeRect.fromLTRB(
                  tapPosition.dx,
                  tapPosition.dy,
                  tapPosition.dx,
                  tapPosition.dy
              ),
              items: [
                PopupMenuItem(
                  value: 'alert',
                  child: Text('ذكرني'),
                ),
                PopupMenuItem(
                    value: "delete",
                    child: Text("حذف"),
                ),
                PopupMenuItem(
                    value: "favorite",
                    child: widget.modelNote.isFavorite
                        ?Text("الغاء المفضلة")
                        :Text("المفضلة"),)
              ],
            );

            if (selected == "delete") {
              context.read<NoteCubit>().deleteNote(widget.modelNote);
              context.read<NoteCubit>().getNote();
            }if(selected == "favorite"){
              context.read<NoteCubit>().toggleFavorite(widget.index);
            }
          },
        onTapDown: (details) {
          setState(() {
            isPressed = true;
          });
          tapPosition = details.globalPosition ;
        },
        onTapUp: (details) {
          setState(() {
            isPressed = true;
          });
        },
        onTapCancel: () {
          setState(() {
            isPressed = false;
          });
        },

        child: Container(
          padding: EdgeInsets.only(top: 16,bottom: 16,left: 16),
          decoration: BoxDecoration(
              color: Theme.of(context).searchViewTheme.backgroundColor,
              borderRadius: BorderRadius.circular(18)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: CustomText(
                    text: widget.modelNote.title,
                    fontSize: 26),
                subtitle: CustomText(
                  text: widget.modelNote.subTitle,
                  maxLine: 1,
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.4),
                ),
                trailing:IconButton(
                  onPressed: (){},
                  icon:  IconButton(
                    onPressed: () {
                      context.read<NoteCubit>().deleteNote(widget.modelNote);
                      context.read<NoteCubit>().getNote();
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
                        text: widget.modelNote.date,
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.4)),
                      IconButton(
                        icon: Icon(
                          widget.modelNote.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: widget.modelNote.isFavorite
                              ? Colors.black54
                              : Colors.black54,
                          size: 25,
                        ),
                        onPressed: () {
                          context.read<NoteCubit>().toggleFavorite(widget.index);
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
