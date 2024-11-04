import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:italian_vendor_app/screens/before_login/login/login_cubit.dart';
import 'package:italian_vendor_app/screens/before_login/login/login_ui.dart';

import '../../../services/shared_preferences/shared_preference_logic.dart';
import '../../../utils/app_dialog.dart';

part 'first_page_state.dart';

class FirstPageCubit extends Cubit<FirstPageState> {
  FirstPageCubit() : super(FirstPageInitial());

  void log_out({required BuildContext context}) {
    AppDialog.instance().confDialog(
        context: context,
        title: 'Confirm Log Out',
        content: 'Are you sure you want to Log Out',
        onActionPressed: () async {
          await SharedPreferenceLogic.setLoginFalse();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => LoginCubit(),
                        child: LoginUi(),
                      )),
              (Route<dynamic> route) => false);
        });
  }
}
