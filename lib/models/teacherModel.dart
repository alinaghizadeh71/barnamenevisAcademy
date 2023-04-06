class TeacherModel {
  TeacherModel({
    required this.Id,
    required this.des,
    required this.Path,
    required this.Title,
    required this.course,
    required this.historyEdu,
    required this.historyTeacher,
    required this.historyPerformance,
  });
  late final String Id;
  late final String des;
  late final String Path;
  late final String Title;
  late final String course;
  late final String historyEdu;
  late final String historyTeacher;
  late final String historyPerformance;
  
  TeacherModel.fromJson(Map<String, dynamic> json){
    Id = json['Id'];
    des = json['des'];
    Path = json['Path'];
    Title = json['Title'];
    course = json['course'];
    historyEdu = json['historyEdu'];
    historyTeacher = json['historyTeacher'];
    historyPerformance = json['historyPerformance'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Id'] = Id;
    _data['des'] = des;
    _data['Path'] = Path;
    _data['Title'] = Title;
    _data['course'] = course;
    _data['historyEdu'] = historyEdu;
    _data['historyTeacher'] = historyTeacher;
    _data['historyPerformance'] = historyPerformance;
    return _data;
  }
}