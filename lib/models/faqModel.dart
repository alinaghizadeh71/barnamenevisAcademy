class FaqModel {
  FaqModel({
    required this.Id,
    required this.answer,
    required this.question,
  });
  late final String Id;
  late final int id;
  late final String answer;
  late final String question;
  
  FaqModel.fromJson(Map<String, dynamic> json){
    Id = json['Id'];
    answer = json['answer'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Id'] = Id;
    _data['answer'] = answer;
    _data['question'] = question;
    return _data;
  }
}