import 'dart:convert';

import 'package:e_commerce/api/model/request/LoginRequest.dart';
import 'package:e_commerce/api/model/request/RegisterRequest.dart';
import 'package:e_commerce/api/model/response/LoginResponse.dart';
import 'package:e_commerce/api/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  // create function to make the register send the info and take the response
    Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone) async {
    // we will take the info from user and send it to our model class
    var requestBody = RegisterRequest(
        name: name,
        email: email,
        password: password,
        repassword: rePassword,
        phone: phone);

    // make the url for api call
    var url = Uri.https(ApiConstant.BASE_URL, ApiConstant.REGISTER_API);

    // the response what we will send to the back end
    var response = await http.post(url, body: requestBody.toJson());

    // the response what we will tak will put it on response
    // model but convert it from json
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }

    Future<LoginResponse> login( String email, String password) async {
     // we will take the info from user and send it to our model class
     var requestBody = LoginRequest(
         email: email,
         password: password);

     // make the url for api call
     var url = Uri.https(ApiConstant.BASE_URL, ApiConstant.LOGIN_API);

     // the response what we will send to the back end
     var response = await http.post(url, body: requestBody.toJson());

     // the response what we will tak will put it on response
     // model but convert it from json
     return LoginResponse.fromJson(jsonDecode(response.body));
   }



}

class ApiConstant {
  static const String BASE_URL = 'route-ecommerce.vercel.app';
  static const String REGISTER_API = '/api/v1/auth/signup';
  static const String LOGIN_API = 'api/v1/auth/signin';

}
