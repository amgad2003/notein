import '../../Model/model_note.dart';

abstract class FavoriteState{}

final class InitialState extends FavoriteState{}

final class LoadingState extends FavoriteState{}

<<<<<<< HEAD
final class FavoriteSuccessState extends FavoriteState{
  final List<ModelNote> favoriteList ;
  FavoriteSuccessState(this.favoriteList);
=======
final class SuccessState extends FavoriteState{
  final List<ModelNote> favoriteList ;
  SuccessState(this.favoriteList);
>>>>>>> 1bf05e125ccd873659776303139dfc2e55cc50b9
}

