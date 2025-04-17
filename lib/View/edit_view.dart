import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notein0/Model/model_note.dart';
import 'package:notein0/View/home_view.dart';
import 'package:notein0/widget/customText.dart';
import 'package:notein0/widget/custom_icon_back.dart';
import 'package:page_transition/page_transition.dart';
import '../Cubits/Note_cubits/note_cubit.dart';
import '../widget/custom_row_app_bar.dart';
import '../widget/custom_text_field_title.dart';

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
   late TextDirection textDirection = TextDirection.LTR ;
  final String date = DateFormat("yyy-MM-dd -hh:mm a").format(DateTime.now());

   @override
  void initState() {
    super.initState();
       title.text= widget.note.title;
       subTitle.text=widget.note.subTitle;
       title.addListener(() {
         if(title.text.isNotEmpty){
           final firstChar = title.text.characters.first;
           final isAR = RegExp("r'^[\u0600-\u06FF]").hasMatch(firstChar);
           setState(() {
             textDirection = isAR
                 ?TextDirection.RTL
                 :TextDirection.LTR;
           });
         }
       },);
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
          toolbarHeight: 60,
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
                    date:  date,
                    color: 0);
                context.read<NoteCubit>().updateNote(widget.index, note);
              }
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) =>  HomeView(),),
                  (route) =>  false);
            },
            icon: Icons.done,
            text: 'Edit Note')
          ),
        body: Padding(
          padding: const  EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
             const SizedBox(height: 10,),

               CustomTextFieldTitle(
                 title: title,
                 color: Colors.grey,
                 enabeledBorder: UnderlineInputBorder(
                     borderSide: BorderSide(
                         color: Theme.of(context).appBarTheme.titleTextStyle!.color??Colors.white)),
                 focuseedBorder: UnderlineInputBorder(
                     borderSide: BorderSide(
                         color: Theme.of(context).appBarTheme.titleTextStyle!.color??Colors.white)),
               ),
              const SizedBox(height: 10,),
              CustomText(
                text: widget.note.date,
                color: Colors.grey.shade800,),
              Expanded(
                  child: TextField(
                    controller: subTitle,
                    maxLines: 50,
                      style: TextStyle(color: Theme.of(context).appBarTheme.titleTextStyle!.color??Colors.white),
                      decoration: const InputDecoration(
                          hintText: " ... ابدأ بالكتابة",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none
                      ),
                    )
                  )
            ],
          ),
        ),
      ),
    );
  }
}

