
import 'package:e_commerce/api/api_manager.dart';
import 'package:e_commerce/base/base_viewModel.dart';
import 'package:e_commerce/provider/app_config_provider.dart';
import 'package:e_commerce/ui/login/login_navigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator>  {

  AppConfigProvider? appConfigProvider ;

  Future<void> login(String email, String pass) async {
    navigator?.showProgressDialog('Loading...');

    try {
      var response = await ApiManager.login(email, pass);

      navigator?.hideDialoge();




      if (response.message != null) {
        navigator?.showMessage(response.message.toString(),
            posActionTitle: 'OK');

        return;
      }
      appConfigProvider?.updateToken(response.token);

      navigator?.goToHome();

    } catch (e) {
      navigator?.hideDialoge();
      navigator?.showMessage(' Error , ' + e.toString(), posActionTitle: 'ok');
    }
  }
}
