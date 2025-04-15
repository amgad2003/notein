import 'package:notein0/Model/model_note.dart';

abstract class SearchState {}
final class InitialState extends SearchState {}
final class LoadingState extends SearchState {}
final class SuccessSate extends SearchState {
  final List<ModelNote> listSearch;
  SuccessSate(this.listSearch);
}
final class FailureState extends SearchState{
  final String failure;
  FailureState(this.failure);
}