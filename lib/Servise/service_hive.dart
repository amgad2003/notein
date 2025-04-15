import 'dart:async';
import 'package:hive/hive.dart';
import 'package:notein0/Model/model_note.dart';

class ServiceHive {
 static const String noteBox = "NoteBox";
 static late Box<ModelNote> myBox;

 static Future<void> openHiveBox ()async{
   myBox = await Hive.openBox<ModelNote>(noteBox);
 }
 static Future<void>addNote(ModelNote note )async{
   await myBox.add(note);
 }
 static Future<void>updateNote(int index , ModelNote update)async{
   await myBox.putAt(index, update);
 }
 static Future<void>deleteNote(int index)async{
   await myBox.deleteAt(index);
 }
  static List <ModelNote> search (query){
   if(query.isEmpty){
     return [];
   }
   query = query.toString().toLowerCase();
     return myBox.values.where((note) {
       return note.title.toLowerCase().contains(query)||
       note.subTitle.toLowerCase().contains(query);
     }).toList();
 }
 static  List <ModelNote>get(){
    return myBox.values.toList();
 }

}