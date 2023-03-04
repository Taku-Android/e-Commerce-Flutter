import 'package:e_commerce/api/model/response/LoginResponse.dart';
import 'package:e_commerce/api/model/response/RegisterResponse.dart';

abstract class AuthRepository{

  /// return token in case successful
  /// and null in case failed
  Future<String?> login(String email , String password);
  Future<String?> register(String name , String email , String password , String rePassword , String phone);




}

abstract class AuthRemoteDataSource{

  /// return token in case successful
  /// and null in case failed
  Future<LoginResponse> login(String email , String password);
  Future<RegisterResponse> register(String name , String email , String password , String Confpassword , String phone);




}


