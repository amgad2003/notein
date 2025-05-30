
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        onTapDown: (details) {
          setState(() {
            isPressed = true;
          });
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
          padding: const EdgeInsets.only(top: 16,bottom: 16,left: 16),
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
                    fontSize: 20,
                    color: Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.black
                ),
                subtitle: CustomText(
                  text: widget.modelNote.subTitle,
                  maxLine: 1,
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
                trailing: IconButton(
                  onPressed: () {
                    context.read<NoteCubit>().deleteNote(widget.modelNote);
                    context.read<NoteCubit>().getNote();
                  },
                  icon: Icon(
                      Icons.delete,size: 30
                  ),
                    color: Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.black
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        text: widget.modelNote.date,
                        fontSize: 14,
                        color:Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.black
              ),
                      IconButton(
                        icon: Icon(
                          widget.modelNote.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: widget.modelNote.isFavorite
                              ? Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.black
                              : Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.black,
                          size: 25,
                        ),
                        onPressed: () {
                          context.read<NoteCubit>().toggleFavorite(widget.modelNote);
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
