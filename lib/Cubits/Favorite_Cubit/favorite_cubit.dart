
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Model/model_note.dart';
import '../Note_cubits/note_cubit.dart';
import '../Note_cubits/note_state.dart' show SuccessState;
import 'favorite_state.dart' show FavoriteState, FavoriteSuccessState, InitialState;

class FavoriteCubit extends Cubit<FavoriteState>{
  final NoteCubit noteCubit;
  late final StreamSubscription streamSubscription ;

  FavoriteCubit(this.noteCubit) : super( InitialState()) {
    // Listen to changes in NoteCubit
    streamSubscription = noteCubit.stream.listen((noteState) {
      if (noteState is SuccessState) {
        updateFavoriteList(noteState.listNote);
      }
    });
  }
  static List<ModelNote> favoriteNote = [];
  // static List<ModelNote> note = [];


  Future<void>  updateFavoriteList(List<ModelNote> notes)async {
    favoriteNote = notes.where((n) => n.isFavorite).toList();
    emit(FavoriteSuccessState(favoriteNote) as FavoriteState);
  }



  void toggleFavorite(int index) {
    favoriteNote[index].isFavorite = ! favoriteNote[index].isFavorite;
    favoriteNote[index].save();
    updateFavoriteList(NoteCubit.note);
  }

}
