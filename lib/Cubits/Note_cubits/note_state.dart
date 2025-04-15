import 'package:notein0/Model/model_note.dart';

<<<<<<< HEAD
abstract class NoteState{
}
final class InitialState extends NoteState{}
final class LoadingState extends NoteState{}
final class SuccessState extends NoteState{
   List<ModelNote> listNote;
=======
abstract class NoteState{}
final class InitialState extends NoteState{}
final class LoadingState extends NoteState{}
final class SuccessState extends NoteState{
  final List<ModelNote> listNote;
>>>>>>> 1bf05e125ccd873659776303139dfc2e55cc50b9
  SuccessState(this.listNote);
}


final class FaliureState extends NoteState{
  final String erorrMessage;
  FaliureState(this.erorrMessage);
}
