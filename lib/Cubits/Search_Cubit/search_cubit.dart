import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notein0/Cubits/Search_Cubit/search_state.dart';
import '../../Model/model_note.dart';
import '../../Servise/service_hive.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit() : super(InitialState());

  static List<ModelNote> searchListNote = [];

  searchNote(query){
    emit(LoadingState());
    try{
      searchListNote = ServiceHive.search(query);
      emit(SuccessSate(searchListNote));
    }
    catch(e){
      emit(FailureState(e.toString()));
    }
  }
}