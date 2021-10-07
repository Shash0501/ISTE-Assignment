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

  ResultModel({
    required this.subject,
    required this.correctanswers,
    required this.marks,
  });
}
