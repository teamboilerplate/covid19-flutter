import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/data/network/constants/endpoints.dart';
import 'package:covid19/utils/cache_manager.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/strings.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/res/asset_images.dart';
import 'package:covid19/widgets/sized_box_height_widget.dart';
import 'package:covid19/utils/device/device_utils.dart';

/// Screen to display attractive graphic while the content is being
/// loaded in the background
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);

    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: Stack(
        children: <Widget>[
          // Preload prevention Image to avoid the very short spanning white screen
          // before the Image is loaded
          Opacity(
            opacity: 0,
            child: CachedNetworkImage(
              imageUrl: Endpoints.fetchPreventionGraphic,
              cacheManager: CacheManager(),
            ),
          ),

          // Preload Information Image to avoid the very short spanning white screen
          // before the Image is loaded
          Opacity(
            opacity: 0,
            child: CachedNetworkImage(
              imageUrl: Endpoints.fetchInformatiionGraphic,
              cacheManager: CacheManager(),
            ),
          ),

          // Actual Splash Screen Data
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // Actual SplashScreen
              Center(
                child: Image(
                  width: screenWidth / 0.75,
                  image: const AssetImage(
                    AssetImages.splash,
                  ),
                ),
              ),

              // Vertical Spacing
              SizedBoxHeightWidget(screenHeight / 25),

              Text(
                Strings.appName,
                style: TextStyles.hightlightText.copyWith(
                  fontSize: screenWidth / 15,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
