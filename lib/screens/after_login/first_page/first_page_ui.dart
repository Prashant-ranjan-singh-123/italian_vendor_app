import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:italian_vendor_app/screens/after_login/first_page/first_page_cubit.dart';

class FirstPageUi extends StatefulWidget {
  const FirstPageUi({super.key});

  @override
  State<FirstPageUi> createState() => _FirstPageUiState();
}

class _FirstPageUiState extends State<FirstPageUi> {

  late FirstPageCubit cubit;

  @override
  void initState() {
    cubit = context.read<FirstPageCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login Screen'),
              _log_out_button(context: context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _log_out_button({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 51,
        child: ElevatedButton(
            onPressed: () {
              cubit.log_out(context: context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF228E12),
            ),
            child: Text(
              'Log Out',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'BR Firma',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            )),
      ),
    );
  }
}
