import 'package:flutter/material.dart';

/// Creates a Vertical Space when provided with the height
/// as a positional paramter
class SizedBoxHeightWidget extends StatelessWidget {
  final double height;

  const SizedBoxHeightWidget(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
