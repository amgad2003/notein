import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notein0/Cubits/Note_cubits/note_state.dart';
import 'package:notein0/Cubits/Search_Cubit/search_cubit.dart';
import 'package:notein0/Model/model_note.dart';
import 'package:notein0/Services/service_hive.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(InitialState());

  static List <ModelNote> note = [];



  // Future <void> getNote()async {
  //   emit(LoadingState());
  //   try {
  //     note = await ServiceHive.get();
      Future<void> getNote()async {
        emit(LoadingState());
        try {
          note = ServiceHive.get();
          emit(SuccessState(note));
        }
        catch (e) {
          emit(FailureState(e.toString()));
        }
      }

      Future<void> deleteNote(ModelNote note) async {
        emit(LoadingState());
        try {
          await ServiceHive.deleteNote(note);
          getNote();
        }
        catch (e) {
          emit(FailureState(e.toString()));
        }
      }

      Future<void> addNote(ModelNote note) async {
        emit(LoadingState());
        try {
          await ServiceHive.addNote(note);
          getNote();
        }
        catch (e) {
          emit(FailureState(e.toString()));
        }
      }

      Future<void> updateNote(int index, ModelNote update) async {
        emit(LoadingState());
        try {
          await ServiceHive.updateNote(index, update);
          getNote();
        }
        catch (e) {
          emit(FailureState(e.toString()));
        }
      }


      void toggleFavorite(int index) {
        note[index].isFavorite = !note[index].isFavorite;
        note[index].save();
        emit(SuccessState(note));
      }
}
