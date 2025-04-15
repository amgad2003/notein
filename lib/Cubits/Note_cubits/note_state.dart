import 'package:notein0/Model/model_note.dart';

abstract class NoteState{}
final class InitialState extends NoteState{}
final class LoadingState extends NoteState{}
final class SuccessState extends NoteState{
  final List<ModelNote> listNote;
  SuccessState(this.listNote);
}


final class FaliureState extends NoteState{
  final String erorrMessage;
  FaliureState(this.erorrMessage);
}
