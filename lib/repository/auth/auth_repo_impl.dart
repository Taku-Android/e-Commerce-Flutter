import 'package:e_commerce/repository/auth_repo_contract.dart';

class AuthRepositoryImpl implements AuthRepository{

  AuthRemoteDataSource authRemoteDataSource ;
  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<String?> login(String email, String password) async {

    var response = await authRemoteDataSource.login(email, password);

    return response.token ;
  }

  @override
  Future<String?> register(String name, String email, String password, String rePassword, String phone) async {

    var response = await authRemoteDataSource.register(name, email, password, rePassword , phone);

    return response.token ;

  }

}