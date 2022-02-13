import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Topic {
  final String id;
  final String title;
  final String description;
  final String img;
  final List<Quiz> quizzes;

  Topic({
    this.id = '',
    this.title = '',
    this.description = '',
    this.img = '',
    this.quizzes = const [],
  });

  /// A necessary factory constructor for creating a new Topic instance
  /// from a map. Pass the map to the generated `_$TopicFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Topic.
  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$TopicToJson`.
  Map<String, dynamic> toJson() => _$TopicToJson(this);
}

@JsonSerializable()
class Quiz {
  String id;
  String title;
  String description;
  String video;
  String topic;
  List<Question> questions;

  Quiz(
      {this.title = '',
      this.video = '',
      this.description = '',
      this.id = '',
      this.topic = '',
      this.questions = const []});

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
  Map<String, dynamic> toJson() => _$QuizToJson(this);
}

@JsonSerializable()
class Report {
  String uid;
  int total;
  Map topics;

  Report({this.uid = '', this.topics = const {}, this.total = 0});

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

@JsonSerializable()
class Question {
  String text;
  List<Option> options;
  Question({this.options = const [], this.text = ''});

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable()
class Option {
  String value;
  String detail;
  bool correct;
  Option({this.value = '', this.detail = '', this.correct = false});

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
