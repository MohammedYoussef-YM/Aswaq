class UserInfoModel {
  int id;
  String fName;
  String lName;
  String phone;
  String email;
  String image;
  String isPhoneVerified;
  String emailVerifiedAt;
  String createdAt;
  String updatedAt;

  UserInfoModel(
      {this.id,
        this.fName,
        this.lName,
        this.phone,
        this.email,
        this.image,
        this.isPhoneVerified,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    isPhoneVerified = json['is_phone_verified'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['image'] = this.image;
    data['is_phone_verified'] = this.isPhoneVerified;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
