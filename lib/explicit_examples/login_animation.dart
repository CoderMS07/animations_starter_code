import 'package:flutter/material.dart';

class LoginScreenAnimation extends StatefulWidget {
  const LoginScreenAnimation({super.key});

  @override
  State<LoginScreenAnimation> createState() => _LoginScreenAnimationState();
}

class _LoginScreenAnimationState extends State<LoginScreenAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> logoopacity;
  late AnimationController controller;
  late Animation<Offset> slideanimation;
  late Animation<double> scaleanimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    logoopacity = Tween<double>(begin: 0, end: 1).animate(controller);
    slideanimation = Tween(begin: const Offset(-1, -1), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    scaleanimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: logoopacity,
              child: const FlutterLogo(
                size: 100.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SlideTransition(
                position: slideanimation,
                child: ScaleTransition(
                  scale: scaleanimation,
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
