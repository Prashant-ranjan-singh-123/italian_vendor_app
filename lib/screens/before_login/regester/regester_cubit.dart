import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:italian_vendor_app/utils/app_dialog.dart';

part 'regester_state.dart';

class RegesterCubit extends Cubit<RegesterState> {
  RegesterCubit() : super(RegesterInitial());

  void tap_on_image_icon({required BuildContext context}) {
    AppDialog.instance().infoDialog(
        context: context,
        title: 'Under Construction',
        content: 'Currently this feature is in under construction');
  }

  void regester_button({required BuildContext context}) {
    AppDialog.instance().infoDialog(
        context: context,
        title: 'Under Construction',
        content: 'Currently this feature is in under construction');
  }
}
