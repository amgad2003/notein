import 'package:notein0/Model/model_note.dart';

abstract class SearchState {}
final class SearchInitialState extends SearchState {}
final class SearchLoadingState extends SearchState {}
final class SearchSuccessSate extends SearchState {
  final List<ModelNote> listSearch;
  SearchSuccessSate(this.listSearch);
}
final class SearchFailureState extends SearchState{
  final String failure;
  SearchFailureState(this.failure);
}