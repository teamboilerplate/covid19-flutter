import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/res/asset_images.dart';
import 'package:covid19/utils/device/device_utils.dart';
import 'package:flutter/material.dart';

/// Creates the Symptom Checker Card in the HomePage
/// TODO : Needs to be redirected to the Symptom Checker Questionnaire
class SymptomCheckerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        // Using a Container to give the [BorderRadius], [BoxShadow],
        // and [Color] for the background
        Container(
          height: screenHeight / 6.5,
          width: screenWidth / 1.1,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                offset: Offset(-2, 10),
                blurRadius: 10,
                color: AppColors.boxShadowColor,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(screenWidth / 10),
            ),
            color: AppColors.primaryColor,
          ),

          // Stack is used to position the virus graphic
          child: Stack(
            children: <Widget>[
              PositionedDirectional(
                bottom: -screenHeight / 30,
                start: -screenWidth / 20,
                child: Image.asset(
                  AssetImages.virus,
                  width: screenWidth / 4,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: screenWidth / 8,
                  top: screenHeight / 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Wrapping the Rich Text in a Sized Box to define a Width
                    // which in turns alow multi-line text
                    SizedBox(
                      width: screenWidth / 2,
                      child: RichText(
                        softWrap: true,
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: 'Self Check Up Covid-19\n\n',
                            style: TextStyles.homeSymptonCheckerHeadingTextStyle
                                .copyWith(
                              fontSize: screenWidth / 25,
                            ),
                          ),
                          TextSpan(
                            text:
                                'Contains several list of questions to check your physical condition',
                            style: TextStyles
                                .homeSymptonCheckerSubHeadingTextStyle
                                .copyWith(
                              fontSize: screenWidth / 33,
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: screenWidth / 15,
                      color: AppColors.whiteColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
