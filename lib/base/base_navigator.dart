import 'dart:ui';

abstract class BaseNavigator{
  void hideDialoge();

  void showMessage(String message,
      {String? posActionTitle,
        VoidCallback? posAction,
        String? negActionTitle,
        VoidCallback? negAction ,
        bool isDismissible = true});

  void showProgressDialog(String loadingMessage);


}