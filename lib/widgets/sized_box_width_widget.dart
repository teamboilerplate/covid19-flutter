import 'package:flutter/material.dart';

/// Creates a Vertical Space when provided with the height
/// as a positional paramter
class SizedBoxWidthWidget extends StatelessWidget {
  final double width;

  const SizedBoxWidthWidget(this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
