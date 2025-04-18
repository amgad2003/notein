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

      Future<void> addNote(ModelNote noteIn) async {
        emit(LoadingState());
        try {
          await ServiceHive.addNote(noteIn);
          note =  ServiceHive.get();
          note.removeWhere((n) => n.id == noteIn.id);
          note.insert(0, noteIn);
          emit(SuccessState(note));
        }
        catch (e) {
          emit(FailureState(e.toString()));
        }
      }

      Future<void> updateNote(int index, ModelNote update) async {
        emit(LoadingState());
        try {
          await ServiceHive.updateNote(index, update);
          // getNote();
          note = ServiceHive.get();
          note.removeWhere((n) => n.id == update.id,);
          note.insert(0, update);
          emit(SuccessState(note));
        }
        catch (e) {
          emit(FailureState(e.toString()));
        }
      }


      void toggleFavorite(ModelNote noteIn) {
        for( var x in note){

          if(x.id == noteIn.id){
           x.isFavorite =! noteIn.isFavorite;
           x.save();
          }
          // getNote();
        }
        emit(SuccessState(note));
      }
}
