import 'package:flutter/material.dart';

class RegesterUi extends StatelessWidget {
  const RegesterUi({super.key});

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
