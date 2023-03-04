import 'package:e_commerce/api/model/response/ServerError.dart';

import 'User.dart';

/// data : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti222@gmail.com","phone":"01010700700","password":"$2a$12$c2JOGM97MA4ETjNA6lp3N.48FkWHiWA112jUkuvCcePpUCThJzsky","role":"user","_id":"63e7f65981519e8154ffb9a6","createdAt":"2023-02-11T20:11:05.036Z","updatedAt":"2023-02-11T20:11:05.036Z","__v":0}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZTdmNjU5ODE1MTllODE1NGZmYjlhNiIsImlhdCI6MTY3NjE0NjI2NSwiZXhwIjoxNjgzOTIyMjY1fQ.5A2sS2B35dhwjVxYVGZJBJUjgIJgFLx2C_wHMN7EJGM"

class RegisterResponse {
  RegisterResponse({
      this.user,
      this.token,});

  RegisterResponse.fromJson(dynamic json) {
    user = json['data'] != null ? User.fromJson(json['data']) : null;
    token = json['token'];
    // this we get it from the error model
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(ServerError.fromJson(v));
      });
    }
  }
  User? user;
  String? token;
  // this we get it from the error model
  List<ServerError>? errors;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['data'] = user?.toJson();
    }
    // this we get it from the error model
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    map['token'] = token;
    return map;
  }


  String mergeErrors(){
    String message = '' ;
    errors?.forEach((error) {
      message += '${error.param} : ' ;
      message +=   '${error.msg?? ''}\n' ;
    });

    return message;

  }

}