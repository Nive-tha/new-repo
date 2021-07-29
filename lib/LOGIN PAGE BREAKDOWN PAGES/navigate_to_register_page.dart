import 'package:flutter/material.dart';

Widget navigateToRegisterPageWidget(onTap, heightHere, widthHere, statusHere) {
  return InkWell(
    onTap: onTap,
    child: Container(
        height: ((heightHere - statusHere)) * 0.10,
        width: widthHere * 0.7,
        child: Center(
          child: Text(
            'Don\'t have an account? Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              decoration: TextDecoration.underline,
            ),
          ),
        )),
  );
}
