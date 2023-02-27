import 'package:flutter/material.dart';

class LoadingIndicatorComponent extends StatelessWidget {
  const LoadingIndicatorComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
