import 'package:e_commerce/api/api_manager.dart';
import 'package:e_commerce/api/model/response/LoginResponse.dart';
import 'package:e_commerce/api/model/response/RegisterResponse.dart';
import 'package:e_commerce/repository/auth_repo_contract.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{

  ApiManager apiManager ;
  AuthRemoteDataSourceImpl(this.apiManager);

  @override
  Future<LoginResponse> login(String email, String password) async {

    var response = await apiManager.login(email , password);

    return response ;
  }


  @override
  Future<RegisterResponse> register(String name, String email, String password, String rePassword, String phone) async {

    var response = await apiManager.register(name, email, password, rePassword, phone);

    return response ;


  }

}