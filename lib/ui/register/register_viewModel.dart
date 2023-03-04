import 'package:e_commerce/api/api_manager.dart';
import 'package:e_commerce/base/base_viewModel.dart';
import 'package:e_commerce/provider/app_config_provider.dart';
import 'package:e_commerce/repository/auth/auth_remote_dataSource_impl.dart';
import 'package:e_commerce/repository/auth/auth_repo_impl.dart';
import 'package:e_commerce/repository/auth_repo_contract.dart';
import 'package:e_commerce/ui/login/login_navigator.dart';
import 'package:e_commerce/ui/register/register_viewModel.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends BaseViewModel<LoginNavigator> {

  AppConfigProvider? appConfigProvider ;


  late AuthRepository authRepository ;
  late AuthRemoteDataSource authRemoteDataSource ;
  late ApiManager apiManager ;
  RegisterViewModel(){
    apiManager = ApiManager();
    authRemoteDataSource = AuthRemoteDataSourceImpl(apiManager);
    authRepository = AuthRepositoryImpl(authRemoteDataSource);
  }

  register(String name, String email, String mobile, String pass,
      String confPass) async {
    navigator?.showProgressDialog('Loading...');

    try {
      var token =
          await authRepository.register(name, email, pass, confPass, mobile);

      navigator?.hideDialoge();

      if (token == null) {
        navigator?.showMessage(/*response.mergeErrors()*/
        'Unable to register'
        , posActionTitle: 'OK');

        return;
      }

      navigator?.showMessage('Successful Registration',
          posActionTitle: 'ok' ,
          posAction: (){
            appConfigProvider?.updateToken(token);
            navigator?.goToHome();
          } , isDismissible: false);


    } catch (e) {
      navigator?.hideDialoge();
      navigator?.showMessage(' Error , ' + e.toString(), posActionTitle: 'ok');
    }
  }
}
