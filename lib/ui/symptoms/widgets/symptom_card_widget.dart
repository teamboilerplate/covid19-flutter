import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/utils/cache_manager.dart';
import 'package:covid19/utils/device/device_utils.dart';
import 'package:covid19/widgets/sized_box_height_widget.dart';

/// To Build the widget to display the card for each Symptom
/// **Requires**
/// 1. [title] - title of the Symptom
/// 2. [description] - Description about the symptom
/// 3. [imageURL] - URL for the image specific to the symptom
class SymptomCardWidget extends StatelessWidget {
  final String title, description, imageURL;

  const SymptomCardWidget({
    Key key,
    @required this.title,
    @required this.description,
    @required this.imageURL,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: screenWidth / 1.25,
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
                  offset: Offset(0, 0),
                  blurRadius: 1,
                  color: AppColors.boxShadowColor,
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: AppColors.whiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyles.statisticsHeadingTextStlye.copyWith(
                    fontSize: screenHeight / 45,
                  ),
                ),

                // Vertical Spacing
                SizedBoxHeightWidget(screenHeight / 125),

                Text(
                  description,
                  style: TextStyles.statisticsSubHeadingTextStlye.copyWith(
                    fontSize: screenHeight / 55,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight / 50,
            ),
            child: CachedNetworkImage(
              imageUrl: imageURL,
              height: screenHeight / 10,
              placeholder: (context, url) => Container(
                width: screenHeight / 10,
                height: screenHeight / 10,
                decoration: BoxDecoration(
                  color: AppColors.offBlackColor.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              cacheManager: CacheManager(),
            ),
          ),
        )
      ],
    );
  }
}
