class RegisterModel {
  RegisterModel({
    required this.id,
    required this.idUser,
    required this.idCourse,
  });
  late final String id;
  late final String idUser;
  late final String idCourse;
  
  RegisterModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    idUser = json['idUser'];
    idCourse = json['idCourse'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['idUser'] = idUser;
    _data['idCourse'] = idCourse;
    return _data;
  }
}