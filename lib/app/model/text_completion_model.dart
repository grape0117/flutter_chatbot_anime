class TextCompletionModel {
  final num created;
  final List<TextCompletionData> choices;

  TextCompletionModel({required this.created, required this.choices});

  // Map<String, dynamic> get choices => choices;

  factory TextCompletionModel.fromJson(Map<String, dynamic> json) {
    final textCompletionItems = json['choices'] as List;
    List<TextCompletionData> choices = textCompletionItems
        .map((singleItem) => TextCompletionData.fromJson(singleItem))
        .toList();

    return TextCompletionModel(
      choices: choices,
      created: json['created'],
    );
  }

  List get getChoices => choices;
}

class TextCompletionData {
  final Map<String, dynamic> message;
  final num index;
  final String finish_reason;

  TextCompletionData(
      {required this.message,
      required this.index,
      required this.finish_reason});

  // Map<String, dynamic> get choices => message;
  factory TextCompletionData.fromJson(Map<String, dynamic> json) {
    return TextCompletionData(
      message: json['message'],
      index: json['index'],
      finish_reason: json['finish_reason'],
    );
  }
}
