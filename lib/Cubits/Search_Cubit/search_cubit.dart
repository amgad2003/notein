
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notein0/Cubits/Search_Cubit/search_state.dart';
import '../../Model/model_note.dart';
import '../../Services/service_hive.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit() : super(SearchInitialState());

  static List<ModelNote> searchListNote = [];

  searchNote(query){
    emit(SearchLoadingState());
    try{
      searchListNote = ServiceHive.search(query);
      emit(SearchSuccessSate(searchListNote));
    }
    catch(e){
      emit(SearchFailureState(e.toString()));
    }
  }
}


// import 'dart:async';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:notein0/Cubits/Search_Cubit/search_state.dart';
// import '../Note_cubits/note_cubit.dart';
// import '../Note_cubits/note_state.dart';
//
// class SearchCubit extends Cubit<SearchState> {
//   final NoteCubit noteCubit;
//   late final StreamSubscription streamSubscription ;
//   SearchCubit(this.noteCubit) : super(SearchInitialState());
//   searchNote(String query) {
//     emit(SearchLoadingState());
//     try {
//       if (noteCubit.state is SuccessState) {
//         final notes = (noteCubit.state as SuccessState).listNote;
//
//         final result = notes.where((note) =>
//         note.title.toLowerCase().contains(query.toLowerCase()) ||
//             note.subTitle.toLowerCase().contains(query.toLowerCase())
//         ).toList();
//
//         emit(SearchSuccessSate(result));
//       } else {
//         emit(SearchFailureState("Notes not loaded yet."));
//       }
//     } catch (e) {
//       emit(SearchFailureState(e.toString()));
//     }
//   }
//
// }