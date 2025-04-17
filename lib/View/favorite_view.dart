import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notein0/Cubits/Favorite_Cubit/favorite_cubit.dart';
import 'package:notein0/Cubits/Favorite_Cubit/favorite_state.dart';
import 'package:notein0/Cubits/Note_cubits/note_cubit.dart';
import 'package:notein0/View/home_view.dart';
import 'package:notein0/widget/customText.dart';
import 'package:page_transition/page_transition.dart';
import '../Model/model_note.dart';
import '../widget/custom_container_item.dart';
import '../widget/custom_container_item2.dart';
import '../widget/custom_icon_back.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

    // List<ModelNote> favorite = ;

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
          leading: CustomIconBack(),
          title: CustomText(
            text: "Favorite Notes",
            fontSize: 28,
            fontFamily: "Poppins",)
          ,backgroundColor: Colors.transparent,),
        body: BlocBuilder<FavoriteCubit,FavoriteState>(
          builder: (context, state) {
            if( state is LoadingState){
              return Center(child: CircularProgressIndicator());
            }
            else if(state is FavoriteSuccessState){
              return state.favoriteList.isEmpty
                  ?Center(child: CustomText(text: "لا توجد ملاحظات مفضلة",color: Colors.grey,))
                  :Column(
                children: [
                  SizedBox(height: 20,),
                  Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        itemCount:  state.favoriteList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 20),
                            child: CustomContainerItem(modelNote: state.favoriteList[index], index: index),
                          );
                        },),
                    ),
                  ),
                ],
              );
            }
            else{return CustomText(text: "dddd");}
          },),
// =======
//             builder: (context, state) {
//               if( state is LoadingState){
//                 return Center(child: CircularProgressIndicator());
//               }
//               else if(state is SuccessState){
//                 return state.favoriteList.isEmpty
//                     ?Center(child: CustomText(text: "Not Notes Favorite",color: Colors.grey,))
//                     :Column(
//                       children: [
//                         SizedBox(height: 20,),
//                         Expanded(
//                           child: SizedBox(
//                             child: ListView.builder(
//                                               itemCount:  state.favoriteList.length,
//                                               itemBuilder: (context, index) {
//                             return Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 20),
//                               child: CustomContainerItem2(modelNote: state.favoriteList[index], index: index),
//                             );
//                                               },),
//                           ),
//                         ),
//                       ],
//                     );
//               }
//               else{return CustomText(text: "dddd");}
//             },),
// >>>>>>> 1bf05e125ccd873659776303139dfc2e55cc50b9
      ),
    );
  }
}
