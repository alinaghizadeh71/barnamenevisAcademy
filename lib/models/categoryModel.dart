class CategoryModel {
  CategoryModel({
    required this.Id,
    required this.Title,
  });
  late final String Id;
  late final String Title;  
  CategoryModel.fromJson(Map<String, dynamic> json){
    Id = json['Id'];
    Title = json['Title'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Id'] = Id;
    _data['Title'] = Title;
    return _data;
  }
}