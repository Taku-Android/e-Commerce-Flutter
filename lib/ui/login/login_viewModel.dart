
import 'package:e_commerce/api/api_manager.dart';
import 'package:e_commerce/base/base_viewModel.dart';
import 'package:e_commerce/provider/app_config_provider.dart';
import 'package:e_commerce/repository/auth/auth_remote_dataSource_impl.dart';
import 'package:e_commerce/repository/auth/auth_repo_impl.dart';
import 'package:e_commerce/repository/auth_repo_contract.dart';
import 'package:e_commerce/ui/login/login_navigator.dart';
import 'package:e_commerce/ui/login/login_viewModel.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator>  {

  AppConfigProvider? appConfigProvider ;


  late AuthRepository authRepository ;
  late AuthRemoteDataSource authRemoteDataSource ;
  late ApiManager apiManager ;
  LoginViewModel(){
    apiManager = ApiManager();
    authRemoteDataSource = AuthRemoteDataSourceImpl(apiManager);
    authRepository = AuthRepositoryImpl(authRemoteDataSource);
  }




  Future<void> login(String email, String pass) async {
    navigator?.showProgressDialog('Loading...');

    try {
      var token = await authRepository.login(email, pass);

      navigator?.hideDialoge();




      if (token == null) {
        navigator?.showMessage('Wrong email or password',
            posActionTitle: 'OK' , posAction: (){

            });

        return;
      }
      appConfigProvider?.updateToken(token);

      navigator?.goToHome();

    } catch (e) {
      navigator?.hideDialoge();
      navigator?.showMessage(' Error , ' + e.toString(), posActionTitle: 'ok');
    }
  }
}
