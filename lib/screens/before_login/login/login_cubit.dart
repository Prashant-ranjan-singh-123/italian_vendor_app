import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:italian_vendor_app/screens/after_login/first_page/first_page_cubit.dart';
import 'package:italian_vendor_app/screens/after_login/first_page/first_page_ui.dart';
import 'package:italian_vendor_app/screens/before_login/regester/regester_cubit.dart';
import 'package:italian_vendor_app/screens/before_login/regester/regester_ui.dart';
import 'package:italian_vendor_app/services/shared_preferences/shared_preference_logic.dart';
import 'package:italian_vendor_app/utils/app_dialog.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginCubit() : super(LoginInitial());

  void login({required BuildContext context}) {
    if (email.text == 'test1@gmail.com' && password.text == '1234567890') {
      AppDialog.instance().infoDialog(
          context: context,
          title: 'Success',
          content: 'Login Success',
          onActionPressed: () async {
            await SharedPreferenceLogic.setLoginTrue();
            email.clear();
            password.clear();
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) =>
                BlocProvider(
                  create: (context) => FirstPageCubit(),
                  child: FirstPageUi(),
                )));
          }
      );
    } else {
      AppDialog.instance().infoDialog(
          context: context,
          title: 'Login Fail',
          content: 'Email id or password is incorrect');
    }
  }

  void regester({required BuildContext context}) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
        BlocProvider(
          create: (context) => RegesterCubit(),
          child: RegesterUi(),
        )));
  }

  void dispose() {
    email.dispose();
    password.dispose();
  }
}
