class SlideShowModel {
  SlideShowModel({
    required this.Id,
    required this.Name,
    required this.Path,
  });
  late final String Id;
  late final String Name;
  late final String Path;  
  SlideShowModel.fromJson(Map<String, dynamic> json){
    Id = json['Id'];
    Name = json['Name'];
    Path = json['Path'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Id'] = Id;
    _data['Name'] = Name;
    _data['Path'] = Path;
    return _data;
  }
}