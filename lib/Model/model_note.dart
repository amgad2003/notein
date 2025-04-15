import 'package:hive/hive.dart';
part 'model_note.g.dart';

@HiveType(typeId: 0)
class ModelNote extends HiveObject{

  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color ;
  @HiveField(4)
  bool isFavorite;

  ModelNote({

    required this.title,
    required this.subTitle,
    required this.date,
    required this.color,
    this.isFavorite = false,
    
  });
}