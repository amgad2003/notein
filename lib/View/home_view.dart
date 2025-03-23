import 'package:flutter/material.dart';
import 'package:notein/Model/model_color.dart';
import 'package:notein/View/edit_view.dart';
import 'package:notein/widget/custom_button.dart';
import 'package:notein/widget/custom_row_app_bar.dart';
import '../widget/custom_container_info.dart';
import '../widget/custom_text_field.dart';

class HomeView extends StatefulWidget {
   const HomeView({super.key});

   @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  // List Model Color ********

  List<ModelColor> listColor =[
    ModelColor(color: Color(0xFFffcd7a)),
    ModelColor(color: Color(0xFFe7e896)),
    ModelColor(color: Color(0xFF69bfd4)),
    ModelColor(color: Colors.green),
    ModelColor(color: Color(0xFFffcd7a)),
    ModelColor(color: Color(0xFFe7e896)),
    ModelColor(color: Color(0xFF69bfd4)),
    ModelColor(color: Colors.green),
  ];

  // Navigator **********

   void navigator(){
     final route = MaterialPageRoute(builder: (context) => EditView(),);
     Navigator.push(context, route);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarRow(
            onTap: (){},
            icon: Icons.search,
            text: 'Note'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Color(0xFF2c2c2c),
              context: context, builder: (context) {
            return SizedBox(
              child: Padding(
                padding: const  EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    CustomTextField(labelText: 'Title',),
                    SizedBox(height: 15,),
                    CustomTextField(maxLine: 7,labelText: 'Content'),
                    Spacer(),
                    CustomButton(),
                    SizedBox(height: 25)
                  ],
                ),
              ),
            );
          });
        },
        shape: CircleBorder(),
        backgroundColor: Color(0xFF3eb0a0),
        child: Icon(Icons.add,),),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            Expanded(child: ListView.builder(
              itemCount: listColor.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: InkWell(
                      onTap: navigator,
                      child: CustomContainerInfo(colorMadel: listColor[index])),
                );
              },))
          ],
        ),
      ),
    );
  }
}
