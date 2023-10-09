import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/main_screen.dart';
import 'package:ecommerce/themes/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 2),
            () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainScreen(),
          ),
              (route) => false,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 72,
              width: 72,
            ),
            Text('\nGhamroid',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'android',
                  letterSpacing: 3,
                )),
          ],
        ),
      ),
    );
  }
}
