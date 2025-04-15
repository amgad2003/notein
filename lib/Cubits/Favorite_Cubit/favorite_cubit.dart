import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notein0/Cubits/Favorite_Cubit/favorite_state.dart';
import 'package:notein0/Cubits/Note_cubits/note_cubit.dart';
import '../../Model/model_note.dart';

class FavoriteCubit extends Cubit<FavoriteState>{
  FavoriteCubit() : super(InitialState());

  static List<ModelNote> favoriteNote = [];
  static List<ModelNote> note = NoteCubit.note;

  void getFavoriteNotes() {
    favoriteNote = note.where((n) => n.isFavorite).toList();
    emit(SuccessState(favoriteNote));
    //return searchAndFavoriteNote ;
  }

  void toggleFavorite(int index) {
    favoriteNote[index].isFavorite = ! favoriteNote[index].isFavorite;
    favoriteNote[index].save();
    getFavoriteNotes();
  }
}