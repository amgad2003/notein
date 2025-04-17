import '../../Model/model_note.dart';

abstract class FavoriteState{}

final class InitialState extends FavoriteState{}

final class LoadingState extends FavoriteState{}

final class FavoriteSuccessState extends FavoriteState{
  final List<ModelNote> favoriteList ;
  FavoriteSuccessState(this.favoriteList);

}

