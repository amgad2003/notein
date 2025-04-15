import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notein0/Cubits/Search_Cubit/search_cubit.dart';
import 'package:notein0/View/search_view.dart';
import 'package:notein0/widget/custom_list_bulider.dart';
import 'package:page_transition/page_transition.dart';
import '../widget/custom_drawer.dart';
import '../widget/custom_float_action_botton.dart';
import '../widget/custom_row_app_bar.dart';

class HomeView extends StatefulWidget {
   const HomeView({super.key});

   @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
          backgroundColor: Colors.transparent,
          title:  CustomAppBarRow(
              icon: Icons.search,
              text: 'Notein',
              onTap: () {
                Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop,
                    child: SearchView()));
              },),
      ),
      floatingActionButton:const CustomFlatActionButton(),
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 20),
        child:  Column(
          children: [
            const SizedBox(height: 10),
            CustomListBuilder()
          ],
        ),
      ),
    );
  }
}
