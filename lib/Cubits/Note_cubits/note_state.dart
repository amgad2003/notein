import 'package:notein0/Model/model_note.dart';

abstract class NoteState{
}
final class InitialState extends NoteState{}
final class LoadingState extends NoteState{}
final class SuccessState extends NoteState {
  List<ModelNote> listNote;

  SuccessState(this.listNote);
}
// abstract class NoteState{}
// final class InitialState extends NoteState{}
// final class LoadingState extends NoteState{}
// final class SuccessState extends NoteState{
//   final List<ModelNote> listNote;
//
// }


final class FailureState extends NoteState{
  final String erorrMessage;
  FailureState(this.erorrMessage);
}
