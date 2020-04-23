import 'package:flutter/material.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/text_styles.dart';

/// To display each Myth/Fact item with the relevant shadow
///
/// **Requires**
/// 1. [screenWidth] - Used to position the shadow and size the elements
/// 2. [screenHeight] - Used to position the shadow and size the elements
/// 3. [shadowColor] - For the shadow for each item - Myth/Fact (Red/Green)
/// 4. [text] - For the text to be displayed in the each item (Myth/Fact)
class MythFactItemWidget extends StatelessWidget {
  final double screenWidth, screenHeight;
  final Color shadowColor;
  final String text;

  const MythFactItemWidget({
    Key key,
    @required this.screenWidth,
    @required this.screenHeight,
    @required this.shadowColor,
    @required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Laying out the stack as the bottom most element of the [Stack]
        // to give the affect of the shadow
        // Using [PositionedDirectional] to position the shadow besides the
        // main card to provide the required affect
        PositionedDirectional(
          bottom: -screenHeight / 80,
          start: screenWidth / 13,
          child: Container(
            width: screenWidth / 1.2,
            margin: EdgeInsets.only(
              bottom: screenHeight / 45,
            ),
            padding: EdgeInsets.only(
              left: screenWidth / 10,
              top: screenHeight / 50,
              right: screenWidth / 25,
              bottom: screenHeight / 30,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              color: shadowColor,
            ),
            // Adding the same text as in the Myth/Fact so that size of the item
            // remains the same
            // Setting the opacity to 0 so that it's not visible
            child: Opacity(
              opacity: 0,
              child: Text(
                text,
                style: TextStyles.statisticsHeadingTextStlye.copyWith(
                  fontSize: screenWidth / 20,
                ),
              ),
            ),
          ),
        ),

        // Using [Align] to centre the item with the text (Myth/Fact)
        Align(
          alignment: Alignment.center,
          child: Container(
            width: screenWidth / 1.2,
            margin: EdgeInsets.only(
              bottom: screenHeight / 45,
            ),
            padding: EdgeInsets.only(
              left: screenWidth / 10,
              top: screenHeight / 50,
              right: screenWidth / 25,
              bottom: screenHeight / 30,
            ),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(-1, 1),
                  blurRadius: 1,
                  color: AppColors.boxShadowColor,
                ),
                BoxShadow(
                  offset: Offset(1, -1),
                  blurRadius: 1,
                  color: AppColors.boxShadowColor,
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: AppColors.whiteColor,
            ),

            // Using [IntrinsicHeight]  so that the Height of the widget is
            // based upon the data provided
            // Using [Material] so that the text has a theme and doesn't have a
            // yellow underlined of text - caused due to absence of a theme
            // Occurs because this widget is used to populate a Dialog where the theme isn't provided
            child: IntrinsicHeight(
              child: Material(
                color: AppColors.transparentColor,
                child: Text(
                  text,
                  style: TextStyles.statisticsHeadingTextStlye.copyWith(
                    fontSize: screenWidth / 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
