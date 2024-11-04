import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:italian_vendor_app/screens/before_login/regester/regester_cubit.dart';
import 'package:iconly/iconly.dart';

class RegesterUi extends StatefulWidget {
  const RegesterUi({super.key});

  @override
  State<RegesterUi> createState() => _RegesterUiState();
}

class _RegesterUiState extends State<RegesterUi> {
  late RegesterCubit cubit;

  @override
  void initState() {
    cubit = context.read<RegesterCubit>();
    super.initState();
  }

  @override
  void dispose() {
    // cubit.dispose();
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
                  height: MediaQuery.sizeOf(context).height * 0.05,
                ),
                _image(),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                ),
                _text_field(hintText: 'Enter Your Name'),
                _text_field(hintText: 'Enter Your Email'),
                _text_field(hintText: 'Password'),
                _text_field(hintText: 'Confirm Password'),
                _text_field(hintText: 'Phone Number'),
                _text_field(hintText: 'Vendor Name'),
                _text_field(hintText: 'Store Name'),
                _regester_button(context: context),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                ),
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
        'Sign Up',
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


  Widget _text_field({required String hintText}) {
    return Column(
      children: [
        Padding(
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
                // controller: cubit.password,
                decoration: InputDecoration(
                  hintText: hintText,
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
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.02,
        ),
      ],
    );
  }

  Widget _regester_button({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 51,
        child: ElevatedButton(
            onPressed: () {
              cubit.regester_button(context: context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF228E12),
            ),
            child: Text(
              'Register',
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

  Widget _image(){
    return GestureDetector(
      onTap: (){
        cubit.tap_on_image_icon(context: context);
      },
      child: Container(
        width: 63,
        height: 65,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 63,
                height: 63,
                decoration: ShapeDecoration(
                  color: Color(0x68F8C214),
                  shape: OvalBorder(
                    side: BorderSide(width: 1, color: Color(0xFF228E12)),
                  ),
                ),
                child: Icon(IconlyBold.home, color: Colors.black.withOpacity(0.3),),
              ),
            ),
            Positioned(
              left: 43,
              top: 48,
              child: Container(
                width: 20,
                height: 17,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 1,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: ShapeDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 4,
                      top: 0,
                      child: SizedBox(
                        width: 16,
                        child: Text(
                          '+',
                          style: TextStyle(
                            color: Color(0xFF228E12),
                            fontSize: 12,
                            fontFamily: 'BR Firma',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
