import 'package:hive/hive.dart';
part 'result_model.g.dart';

@HiveType(typeId: 1)
class ResultModel {
  @HiveField(0)
  String subject;

  @HiveField(1)
  int correctanswers;

  @HiveField(2)
  int marks;
  @HiveField(3)
  String playerName;

  ResultModel({
    required this.subject,
    required this.correctanswers,
    required this.marks,
    required this.playerName,
  });
}
