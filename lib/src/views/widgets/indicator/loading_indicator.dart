import 'package:flutter/material.dart';

class MyLoadingIndicator extends StatelessWidget {
  const MyLoadingIndicator({super.key, this.size});
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size ?? 20,
        child: const CircularProgressIndicator.adaptive(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(Colors.black),
        ),
      ),
    );
  }
}
