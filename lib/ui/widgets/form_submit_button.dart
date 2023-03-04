import 'package:flutter/material.dart';

class FormSubmitButton extends StatelessWidget {


  String btnText;
  VoidCallback onPressed;
  FormSubmitButton(this.btnText, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          onPressed;
        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Text(
          btnText,
          style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
