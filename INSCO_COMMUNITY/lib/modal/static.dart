class StaticData {
  String creatorPhoto;
  String whatshappGroupUrl;


  StaticData({
    this.creatorPhoto,
    this.whatshappGroupUrl,

  });



  StaticData.fromJson(Map<String, dynamic> json) {
    creatorPhoto = json['creatorPhoto'];
    whatshappGroupUrl = json['whatshappGroupUrl'];

  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['creatorPhoto'] = creatorPhoto;
    data['whatshappGroupUrl'] = whatshappGroupUrl;
    return data;
  }
}
