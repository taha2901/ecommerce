import 'package:addinfo/core/helper/cach.dart';
import 'package:addinfo/features/auth/presentation/view/login.dart';
import 'package:flutter/material.dart';

void signOut(context) {
  ChachHelper.removeData(key: 'token')!.then((value) => {
        if (value == true)
          {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
              (route) => false,
            )
          }
      });
}