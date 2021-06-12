class Account {
  String id;
  String username;
  String email;
  String photoUrl;
  String bio;
  int batch;
  bool isInscoMember;
  String title;
  String mobileNumber;
  String workPlace;
  bool isEmailVerified;
  bool isMobileNumberVerified;
  bool showEmail;
  bool showMobileNumber;

  Account({
    this.id,
    this.mobileNumber,
    this.username,
    this.batch,
    this.bio,
    this.email,
    this.isInscoMember,
    this.photoUrl,
    this.title,
    this.workPlace,
    this.isEmailVerified,
    this.isMobileNumberVerified,
    this.showEmail,
    this.showMobileNumber,
  });

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    photoUrl = json['photoUrl'];
    email = json['email'];
    bio = json['bio'];
    batch = json['batch'];
    isInscoMember = json['isInscoMember'];
    title = json['title'];
    mobileNumber = json['mobileNumber'];
    workPlace = json['workPlace'];
    isEmailVerified = json['isEmailVerified'];
    isMobileNumberVerified = json['isMobileNumberVerified'];
    showEmail = json['showEmail'];
    showMobileNumber = json['showMobileNumber'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['photoUrl'] = photoUrl == null ? '' : photoUrl;
    data['bio'] = bio == null ? '' : bio;
    data['batch'] = batch;
    data['isInscoMember'] = isInscoMember;
    data['title'] = title;
    data['mobileNumber'] = mobileNumber == null ? '' : mobileNumber;
    data['workPlace'] = '';
    data['isEmailVerified'] = false;
    data['isMobileNumberVerified'] = false;
    data['showEmail'] = false;
    data['showMobileNumber'] = false;
    return data;
  }
}
