import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {

  String label ;

  FormLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Text(label ,
        style: const TextStyle(
          fontSize: 18 ,
          color: Colors.white
        ),
      ),
    );


  }
}
