import 'package:flutter/material.dart';

class DialogUtils {
  static void showProgressDialog(BuildContext context, String message,
      {bool isDismissable = true}) {
    showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 12,
                ),
                Text(message),
              ],
            ),
          );
        },
        barrierDismissible: isDismissable);
  }

  static void showMessage(BuildContext context, String message,
      {String? posActionTitle,
        VoidCallback? posAction,
        String? negActionTitle ,
        VoidCallback? negAction ,
        bool isDismissible = true
      }) {
    showDialog(
        context: context,
        builder: (buildContext) {
          List<Widget> action = [];
          if (posActionTitle != null) {
            action.add(TextButton(onPressed: (){
              Navigator.pop(context);
              if(posAction != null){
                posAction();
              }

            }, child: Text(posActionTitle)));
          }
          if (negActionTitle != null) {
            action.add(TextButton(onPressed: (){
              Navigator.pop(context);
              if(negAction != null){
                negAction();
              }

            }, child: Text(negActionTitle)));
          }

          return AlertDialog(
            actions: action,
            content: Text(message),
          );
        } ,  barrierDismissible: isDismissible);

  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
