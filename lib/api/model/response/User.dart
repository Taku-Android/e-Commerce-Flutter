/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti222@gmail.com"
/// phone : "01010700700"
/// password : "$2a$12$c2JOGM97MA4ETjNA6lp3N.48FkWHiWA112jUkuvCcePpUCThJzsky"
/// role : "user"
/// _id : "63e7f65981519e8154ffb9a6"
/// createdAt : "2023-02-11T20:11:05.036Z"
/// updatedAt : "2023-02-11T20:11:05.036Z"
/// __v : 0

class User {
  User({
      this.name, 
      this.email, 
      this.phone, 
      this.password, 
      this.id,

      });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    id = json['_id'];

  }
  String? name;
  String? email;
  String? phone;
  String? password;
  String? id;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    map['_id'] = id;

    return map;
  }

}