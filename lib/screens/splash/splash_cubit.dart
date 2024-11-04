import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:italian_vendor_app/screens/after_login/first_page/first_page_cubit.dart';
import 'package:italian_vendor_app/screens/after_login/first_page/first_page_ui.dart';
import 'package:italian_vendor_app/screens/before_login/login/login_cubit.dart';
import 'package:italian_vendor_app/screens/before_login/login/login_ui.dart';

import '../../services/shared_preferences/shared_preference_logic.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> changePage({required BuildContext context}) async {

    if(await SharedPreferenceLogic.isLogIn()) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) =>
          BlocProvider(
            create: (context) => FirstPageCubit(),
            child: FirstPageUi(),
          )));
    }else{
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) =>
          BlocProvider(
            create: (context) => LoginCubit(),
            child: LoginUi(),
          )));
    }
  }
}
