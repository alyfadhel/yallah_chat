import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yallah_chat/core/utils/network/local.dart';
import 'package:yallah_chat/modules/login/screens/login.dart';

void signOut(context) {
  CacheHelper.signOut(key: 'uId').then((value) {
    if (value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  });
}

String? uId = '';
