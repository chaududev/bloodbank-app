

class UserInfoStored {
  String? jwt;
  User? user;

  UserInfoStored({this.jwt, this.user});

  UserInfoStored.fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jwt'] = this.jwt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? blocked;
  String? createdAt;
  String? updatedAt;
  String? address;
  String? phoneNumber;
  String? dateofBirth;
  String? fullName;
  bool? gender;

  User(
      {this.id,
      this.username,
      this.email,
      this.provider,
      this.confirmed,
      this.blocked,
      this.createdAt,
      this.updatedAt,
      this.address,
      this.phoneNumber,
      this.dateofBirth,
      this.fullName,
      this.gender});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    provider = json['provider'];
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    address = json['address'];
    phoneNumber = json['PhoneNumber'];
    dateofBirth = json['DateofBirth'];
    fullName = json['FullName'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['provider'] = this.provider;
    data['confirmed'] = this.confirmed;
    data['blocked'] = this.blocked;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['address'] = this.address;
    data['PhoneNumber'] = this.phoneNumber;
    data['DateofBirth'] = this.dateofBirth;
    data['FullName'] = this.fullName;
    data['gender'] = this.gender;
    return data;
  }
}
