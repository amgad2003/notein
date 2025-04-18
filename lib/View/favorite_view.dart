import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notein0/Cubits/Favorite_Cubit/favorite_cubit.dart';
import 'package:notein0/Cubits/Favorite_Cubit/favorite_state.dart';
import 'package:notein0/View/home_view.dart';
import 'package:notein0/widget/customText.dart';
import 'package:page_transition/page_transition.dart';
import '../widget/custom_container_item.dart';
import '../widget/custom_icon_back.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}


class _FavoriteViewState extends State<FavoriteView> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope (
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(type: PageTransitionType.leftToRight,child: HomeView()),
            (route) =>  false,);
        return false ;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: const CustomIconBack(),
          title: const CustomText(
            text: "Favorite Notes",
            fontSize: 28,
            fontFamily: "Poppins",)
          ,backgroundColor: Colors.transparent,),
        body: BlocBuilder<FavoriteCubit,FavoriteState>(
          builder: (context, state) {
            if(state is LoadingState){
              return const Center(child: CircularProgressIndicator());
            }else if(state is FavoriteSuccessState){
              return state.favoriteList.isEmpty
                  ? Center(child: const CustomText(
                  text: "لا توجد ملاحظات",
                  color: Colors.grey,))
                  : Padding(
                  padding:const EdgeInsets.only(top: 20,left: 15,right: 15),
                  child: ListView.builder(
                      itemCount: state.favoriteList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:const EdgeInsets.symmetric(vertical: 4),
                          child: CustomContainerItem(
                              modelNote: state.favoriteList[index],
                              index: index),);
                      },));

            }else{
              return const Center(child: CustomText(text: "خطأ"));}
          }),
      ),
    );
  }
}
