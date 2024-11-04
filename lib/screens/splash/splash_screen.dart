import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:italian_vendor_app/screens/splash/splash_cubit.dart';
import 'package:italian_vendor_app/utils/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image(context: context),
            _text(),
            _button(context: context)
          ],
        ),
      ),
    );
  }

  Widget _image({required BuildContext context}) {
    return Image.asset(
        width: MediaQuery.sizeOf(context).width,
        AppAssets.instance().png_splash);
  }

  Widget _text() {
    return Text(
      'Find all your Groceries here',
      style: TextStyle(
        color: Color(0xFF228E12),
        fontSize: 16,
        fontFamily: 'BR Firma',
        fontWeight: FontWeight.w700,
        height: 0,
      ),
    );
  }

  Widget _button({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: ElevatedButton(
          onPressed: () {
            context.read<SplashCubit>().changePage(context: context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF228E12),
          ),
          child: Text(
            'Get Started',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'BR Firma',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          )),
    );
  }
}
