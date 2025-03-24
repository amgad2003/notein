import 'package:flutter/material.dart';
import 'package:notein/Model/model_color.dart';
import 'package:notein/View/edit_view.dart';
import 'package:notein/widget/custom_appbar.dart';
import 'package:notein/widget/custom_drawer.dart';
import 'package:notein/widget/custom_float_action_botton.dart';
import '../widget/custom_container_info.dart';

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
      drawer: CustomDrawer(),
      appBar: buildAppBar(),
      floatingActionButton: CustomFlatActionButton(),
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
              }))
          ],
        ),
      ),
    );
  }
}
