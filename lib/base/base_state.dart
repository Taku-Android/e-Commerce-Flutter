import 'package:e_commerce/base/base_navigator.dart';
import 'package:e_commerce/base/base_viewModel.dart';
import 'package:e_commerce/ui/dialogUtils.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget ,
  VM extends BaseViewModel> extends State<T>
    implements BaseNavigator {

   late VM viewModel ;

   VM initViewModel();

   @override
  void initState() {
    super.initState();
    viewModel  = initViewModel() ;
    viewModel.navigator = this ;
  }

  @override
  void hideDialoge() {
    DialogUtils.hideDialog(context);
  }

  @override
  void showProgressDialog(String loadingMessage) {
    DialogUtils.showProgressDialog(context, loadingMessage);
  }

  @override
  void showMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool isDismissible = true}) {
    DialogUtils.showMessage(context, message,
        posActionTitle: posActionTitle,
        posAction: posAction,
        negActionTitle: negActionTitle,
        negAction: negAction,
        isDismissible: isDismissible);
  }
}
