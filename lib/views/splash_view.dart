import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sitelemed/views/home_page.dart';
import 'package:sitelemed/views/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isVisible = false;

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        isVisible = true;
      });
      toHomePage();
    });

    super.initState();
  }

  toHomePage() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => PageLogin()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedSwitcher(
              duration: const Duration(seconds: 2),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: isVisible
                  ? Image.asset('assets/images/logo.jpg')
                  // FlutterLogo(size: screenSize.height / 4)
                  : const SizedBox()),
          const SizedBox(height: 25),
          const Text("TELEMEDICINE RSUD Cibinong.",
              style: TextStyle(fontSize: 18)),
          isVisible
              ? const Align(
                  //alignment: FractionalOffset.bottomCenter,
                  heightFactor: 5,
                  alignment: Alignment.bottomCenter,
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ))
              : const SizedBox()
        ],
      )),
    );
  }
}
