import 'package:flutter/material.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/dimens.dart';
import 'package:covid19/constants/strings.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/icons/covid19_icons.dart';
import 'package:covid19/data/symptoms_data.dart';
import 'package:covid19/ui/symptoms/widgets/symptom_card_widget.dart';
import 'package:covid19/utils/custom_scroll_behaviour.dart';
import 'package:covid19/utils/device/device_utils.dart';
import 'package:covid19/widgets/sized_box_height_widget.dart';

/// Displays the list of Symptoms for Covid-19
class SymptomsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);
    return Scaffold(
      // [AppBar] with 0 size used to set the statusbar background color and
      // statusbat text/icon color
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: AppColors.whiteColor,
          brightness: Brightness.light,
          elevation: 0.0,
        ),
      ),

      // Wrapping the contents in [SafeArea] to avoid the Notch (When avaiable) and the bottom
      // navigation bar (Mostly comes in use for iOS Devices)
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Dimens.horizontalPadding,
            Dimens.verticalPadding / 0.75,
            Dimens.horizontalPadding,
            0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Wrapping the header in an Expanded widget to keep it fixed while scrolling
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back Icon
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Covid19Icons.keyboardArrowLeft,
                        size: screenHeight / 45,
                        color: AppColors.blackColor,
                      ),
                    ),

                    // Vertical Spacing
                    SizedBoxHeightWidget(screenHeight / 50),

                    // Page Title
                    Text(
                      Strings.symptomsTitle,
                      style: TextStyles.statisticsHeadingTextStlye.copyWith(
                        fontSize: screenHeight / 35,
                      ),
                    ),

                    // Vertical Spacing
                    SizedBoxHeightWidget(screenHeight / 25),
                  ],
                ),
              ),

              // Symptom Items
              // Wrapping the contents in a [Flexible] to make sure that the remaining space
              // in the screen is filled
              Expanded(
                flex: 6,
                child: ScrollConfiguration(
                  behavior: const CustomScrollBehaviour(),
                  // Use a ListView.builder for performace enahncements
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: symptomsData.length,
                    itemBuilder: (context, index) {
                      return SymptomCardWidget(
                        title: symptomsData[index].title,
                        description: symptomsData[index].description,
                        imageURL: symptomsData[index].imageURL,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
