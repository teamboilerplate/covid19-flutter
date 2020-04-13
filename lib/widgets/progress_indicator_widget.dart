import 'package:flutter/material.dart';
import 'package:covid19/constants/colors.dart';

/// Displays a progress Indicator when called increasing the transparency of the
/// background and showing a [CircularProgressIndicator] at the centre of the device
///
/// Customization has not been provided but can be added if and when required
class CustomProgressIndicatorWidget extends StatelessWidget {
  const CustomProgressIndicatorWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 100,
        constraints: const BoxConstraints.expand(),
        decoration:
            const BoxDecoration(color: Color.fromARGB(100, 105, 105, 105)),
        child: FittedBox(
          fit: BoxFit.none,
          child: SizedBox(
            height: 100,
            width: 100,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: const Padding(
                padding: EdgeInsets.all(25.0),
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.accentColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
