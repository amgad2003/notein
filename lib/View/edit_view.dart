import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notein0/Model/model_note.dart';
import 'package:notein0/View/home_view.dart';
import 'package:notein0/widget/custom_icon_back.dart';
import 'package:page_transition/page_transition.dart';
import '../Cubits/Note_cubits/note_cubit.dart';
import '../widget/custom_row_app_bar.dart';
import '../widget/custom_text_field.dart';

class EditView extends StatefulWidget {
  final int index;
  final ModelNote note;

   const EditView({
    super.key,
    required this.index,
    required this.note});

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  final TextEditingController title = TextEditingController();
  final TextEditingController subTitle=TextEditingController();

   @override
  void initState() {
    super.initState();
       title.text= widget.note.title;
       subTitle.text=widget.note.subTitle;
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(type: PageTransitionType.leftToRight,child: HomeView()),
            (route) =>  false,);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: CustomIconBack(),
          title: CustomAppBarRow(
            onTap: (){
              if(title.text.isEmpty&&subTitle.text.isEmpty){
                context.read<NoteCubit>().deleteNote(widget.note);
              }
             else{
                final note = ModelNote(
                    title: title.text,
                    subTitle: subTitle.text,
                    date: DateTime.now().toString(),
                    color: 0);
                context.read<NoteCubit>().updateNote(widget.index, note);
              }
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) =>  HomeView(),),
                  (route) =>  false);
            },
            icon: Icons.done,
            text: 'Edit Note'),),
        body: Padding(
          padding: const  EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
             const SizedBox(height: 10,),
               TextField(
                  controller:  title ,
                  style: TextStyle(color: Theme.of(context).appBarTheme.titleTextStyle!.color??Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.blueGrey,width: 1.0),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.blueGrey,width: 1.0),
                    ),
                  )
              ),
              const SizedBox(height: 10,),
              Expanded(
                  child: TextField(
                    controller: subTitle,
                    maxLines: 7,
                      style: TextStyle(color: Theme.of(context).appBarTheme.titleTextStyle!.color??Colors.white),
                      decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.blueGrey,width: 1.0),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.blueGrey,width: 1.0),
                      ),
                    )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}