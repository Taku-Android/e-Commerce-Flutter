import 'package:e_commerce/api/api_manager.dart';
import 'package:e_commerce/base/base_viewModel.dart';
import 'package:e_commerce/provider/app_config_provider.dart';
import 'package:e_commerce/ui/login/login_navigator.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends BaseViewModel<LoginNavigator> {

  AppConfigProvider? appConfigProvider ;

  register(String name, String email, String mobile, String pass,
      String confPass) async {
    navigator?.showProgressDialog('Loading...');

    try {
      var response =
          await ApiManager.register(name, email, pass, confPass, mobile);

      navigator?.hideDialoge();

      if (response.errors != null) {
        navigator?.showMessage(response.mergeErrors(), posActionTitle: 'OK');

        return;
      }

      navigator?.showMessage('Successful Registration',
          posActionTitle: 'ok' ,
          posAction: (){
            appConfigProvider?.updateToken(response.token);
            navigator?.goToHome();
          } , isDismissible: false);


    } catch (e) {
      navigator?.hideDialoge();
      navigator?.showMessage(' Error , ' + e.toString(), posActionTitle: 'ok');
    }
  }
}
