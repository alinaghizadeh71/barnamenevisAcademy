class CourseModel {
  CourseModel({
    required this.Id,
    required this.Path,
    required this.Time,
    required this.Title,
    required this.IdTeacher,
    required this.IdCategory,
  });
  late final String Id;
  late final String Path;
  late final String Time;
  late final String Title;
  late final String IdTeacher;
  late final String IdCategory;
  
  CourseModel.fromJson(Map<String, dynamic> json){
    Id = json['Id'];
    Path = json['Path'];
    Time = json['Time'];
    Title = json['Title'];
    IdTeacher = json['Id_Teacher'];
    IdCategory = json['Id_Category'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Id'] = Id;
    _data['Path'] = Path;
    _data['Time'] = Time;
    _data['Title'] = Title;
    _data['Id_Teacher'] = IdTeacher;
    _data['Id_Category'] = IdCategory;
    return _data;
  }
}