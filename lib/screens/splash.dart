import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbuddy/screens/home.dart';
import 'package:gymbuddy/utils/dimensions.dart';
import 'package:gymbuddy/utils/page_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 8)).then((_) {
      Get.off(() => HomePage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Dimensions.deepBlueColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height30, horizontal: Dimensions.width5),
              child: PageWidget.textWidget(
                  textLabel: "GYM BUDDY",
                  fontFamily: 'OpenSans',
                  fontSize: Dimensions.height30,
                  fontWeight: FontWeight.w900,
                  textColor: Dimensions.whiteColor),
            ),
            Expanded(
              child: RotationTransition(
                turns: _animation,
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.height10),
                  child: Image.asset("assets/images/gymbuddy.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
