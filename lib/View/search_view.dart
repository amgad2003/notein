import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notein0/Cubits/Note_cubits/note_cubit.dart';
import 'package:notein0/Cubits/Search_Cubit/search_cubit.dart';
import 'package:notein0/Cubits/Search_Cubit/search_state.dart';
import 'package:notein0/Model/model_note.dart';
import 'package:notein0/View/home_view.dart';
import 'package:notein0/widget/custom_container_item.dart';
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

   List<ModelNote> note = [];

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
            leading: CustomIconBack(),
            title:Row(
                children: [
                  CustomText(
                    text: "Search",
                    fontSize: 22,
                    fontFamily: "Poppins",),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CupertinoTextField(
                      controller: text,
                       placeholder: 'Search ....',
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
                        borderRadius: BorderRadius.circular(9),
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
                return Center(child: CircularProgressIndicator());
              }
              else if( state is SearchSuccessSate){
                return  state.listSearch.isEmpty
                    ?Center(child: CustomText(text: "No notes with this name!",color: Colors.grey,))
                    :Column(
                      children: [
                        SizedBox(height: 20,),
                        Expanded(
                          child: SizedBox(
                            child: ListView.builder(
                                              itemCount: state.listSearch.length,
                                              itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                              child: CustomContainerItem2(modelNote: state.listSearch[index], index: index),
                            );
                                              },),
                          ),
                        ),
                      ],
                    );
              }
              else if(state is SearchFailureState){
                return Center(child: CustomText(
                  text:  (state.failure),
                  color: Colors.grey,));
              }
              else{
                return Center(child: CustomText(
                  text: "Search a note ..",
                  color: Colors.grey,));
              }
            },),
        )
    );
  }
}