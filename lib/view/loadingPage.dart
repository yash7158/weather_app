import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


//laoding page
class loading extends StatelessWidget {
  const loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.5),
      body: Center(
    child: LoadingAnimationWidget.waveDots(
    color: Colors.white,
    size: 100,
    ),));
  }
}
