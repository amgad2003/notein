import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notein0/Cubits/Search_Cubit/search_cubit.dart';
import 'package:notein0/Cubits/Search_Cubit/search_state.dart';
import 'package:notein0/View/home_view.dart';
import 'package:notein0/widget/custom_icon_back.dart';
import 'package:page_transition/page_transition.dart';
import '../widget/customText.dart';
import '../widget/custom_container_item2.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

   final TextEditingController text =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(type: PageTransitionType.leftToRight,child:const HomeView()),
            (route) =>  false,);
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: const CustomIconBack(),
            title:Row(
                children: [
                  const CustomText(
                    text: "Search",
                    fontSize: 22,
                    fontFamily: "Poppins",),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: CupertinoTextField(
                      controller: text,
                       placeholder: ' ... بحث ',
                       placeholderStyle: TextStyle(color: Colors.black54),
                       prefix: IconButton(
                           onPressed: () {
                            context.read<SearchCubit>().searchNote(text.text);

                           },
                           icon: Icon(Icons.search)),
                      onSubmitted: (value) {
                        if(value.isNotEmpty){
                          context.read<SearchCubit>().searchNote(value);
                        }

                      },
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(9),
                        color: Colors.grey.shade500
                      ),
                    )
                  ),
                ],
              )
          ),
        body: BlocBuilder<SearchCubit,SearchState>(
            builder: (context, state) {
              if( state is SearchLoadingState){
                return const Center(child: CircularProgressIndicator());
              }
              else if( state is SearchSuccessSate){
                return  state.listSearch.isEmpty
                    ? const Center(child: CustomText(
                      text: "لا توجد ملاحظات بهذا الاسم",
                      color: Colors.grey,))
                    : Padding(
                       padding: const EdgeInsets.only(top: 20,right: 15,left: 15),
                       child:  ListView.builder(
                         itemCount: state.listSearch.length,
                         itemBuilder: (context, index) {
                           return Padding(
                             padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                             child: CustomContainerItem2(modelNote: state.listSearch[index], index: index),
                           );
                         }));
              }
              else if(state is SearchFailureState){
                return Center(child: CustomText(
                  text:  (state.failure),
                  color: Colors.grey,));
              }
              else{
                return const Center(child: CustomText(
                  text: "ابحث عن الملاحظات",
                  color: Colors.grey,));
              }
            },),
        )
    );
  }
}