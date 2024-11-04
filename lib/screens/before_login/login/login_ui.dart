import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:italian_vendor_app/main.dart';
import 'package:italian_vendor_app/screens/before_login/login/login_cubit.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({super.key});

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {

  late LoginCubit cubit;

  @override
  void initState() {
    cubit = context.read<LoginCubit>();
    super.initState();
  }

  @override
  void dispose() {
    cubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _text(context: context),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                ),
                _text_field(),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                _text_field_2(),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                _login_button(context: context),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                ),
                _sign_up()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _text({required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.05),
      child: Text(
        'Login Now',
        style: TextStyle(
          color: Color(0xFF228E12),
          fontSize: 24,
          fontFamily: 'BR Firma',
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
    );
  }

  Widget _text_field() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: double.infinity,
        height: 51,
        decoration: ShapeDecoration(
          color: Colors.white.withOpacity(0.33),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xAA228E12)),
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 19),
          child: TextField(
            controller: cubit.email,
            decoration: InputDecoration(
              hintText: 'Enter your Email',
              hintStyle: TextStyle(
                color: Color(0x70121111),
                fontSize: 12,
                fontFamily: 'BR Firma',
                fontWeight: FontWeight.w600,
              ),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'BR Firma',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _text_field_2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: double.infinity,
        height: 51,
        decoration: ShapeDecoration(
          color: Colors.white.withOpacity(0.33),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xAA228E12)),
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 19),
          child: TextField(
            controller: cubit.password,
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(
                color: Color(0x70121111),
                fontSize: 12,
                fontFamily: 'BR Firma',
                fontWeight: FontWeight.w600,
              ),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'BR Firma',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _login_button({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 51,
        child: ElevatedButton(
            onPressed: () {
              cubit.login(context: context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF228E12),
            ),
            child: Text(
              'Login',
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

  Widget _sign_up(){
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Don’t have account ?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'BR Firma',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          TextSpan(
            text: ' ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'BR Firma',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyle(
              color: Color(0xFFF8C214),
              fontSize: 14,
              fontFamily: 'BR Firma',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
            recognizer: TapGestureRecognizer()..onTap = (){
              cubit.regester(context: context);
            }
          ),
        ],
      ),
    );
  }
}
