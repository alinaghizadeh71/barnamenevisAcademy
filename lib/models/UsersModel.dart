class UsersModel {
  UsersModel({
    required this.id,
    required this.name,
    required this.family,
    required this.mobile,
  });
  late final String id;
  late final String name;
  late final String family;
  late final String mobile;
  
  UsersModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    family = json['family'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['family'] = family;
    _data['mobile'] = mobile;
    return _data;
  }
}