class CoursesModel {
  CoursesModel({
    required this.Id,
    required this.Des,
    required this.Pic,
    required this.Time,
    required this.Title,
    required this.Video,
    required this.Price1,
    required this.Price2,
    required this.Duration,
    required this.Headline,
    required this.TeacherId,
  });
  late final String Id;
  late final String Des;
  late final String Pic;
  late final String Time;
  late final String Title;
  late final String Video;
  late final String Price1;
  late final String Price2;
  late final String Duration;
  late final String Headline;
  late final String TeacherId;
  
  CoursesModel.fromJson(Map<String, dynamic> json){
    Id = json['Id'];
    Des = json['Des'];
    Pic = json['Pic'];
    Time = json['Time'];
    Title = json['Title'];
    Video = json['Video'];
    Price1 = json['Price1'];
    Price2 = json['Price2'];
    Duration = json['Duration'];
    Headline = json['Headline'];
    TeacherId = json['Teacher_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Id'] = Id;
    _data['Des'] = Des;
    _data['Pic'] = Pic;
    _data['Time'] = Time;
    _data['Title'] = Title;
    _data['Video'] = Video;
    _data['Price1'] = Price1;
    _data['Price2'] = Price2;
    _data['Duration'] = Duration;
    _data['Headline'] = Headline;
    _data['Teacher_id'] = TeacherId;
    return _data;
  }
}