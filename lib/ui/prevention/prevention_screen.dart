import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/constants/strings.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/icons/covid19_icons.dart';
import 'package:covid19/data/network/constants/endpoints.dart';
import 'package:covid19/utils/custom_scroll_behaviour.dart';
import 'package:covid19/utils/image_cache_manager.dart';
import 'package:covid19/utils/device/device_utils.dart';
import 'package:covid19/widgets/custom_alert_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

/// Displays the information in regards to prevention of Coronavirus
/// and reference to where the data is taken from
class PreventionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);
    return Scaffold(
      // To make sure that the top of the body is aligned with top
      // of the AppBar and we do not have any unwanted background colors
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          screenHeight / 25,
        ),
        child: AppBar(
          // Leading set to empty container to remove the back button
          leading: Container(),
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
          actions: <Widget>[
            // Adding padding to the action info button so it doesn't stick
            // to the end of the screen
            Padding(
              padding: EdgeInsets.only(
                right: screenWidth / 25,
              ),
              child: GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomAlertDialog(
                      title: RichText(
                        softWrap: true,
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: '${Strings.dataSource}\n\n\n',
                            style: TextStyles.hightlightText.copyWith(
                              fontSize: screenWidth / 20,
                            ),
                          ),
                          TextSpan(
                            style: TextStyles.statisticsSubHeadingTextStlye
                                .copyWith(
                              fontSize: screenWidth / 25,
                            ),
                            children: <InlineSpan>[
                              TextSpan(
                                text: Strings.informationSourceDescription,
                              ),
                              TextSpan(
                                text: Strings.blog,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.accentBlueColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async => await canLaunch(
                                          Endpoints.dataSourceReferenceURL)
                                      ? launch(Endpoints.dataSourceReferenceURL)
                                      : throw 'Could not launch Refernce URL',
                              ),
                              TextSpan(
                                text: Strings.writtenBy,
                              ),
                              TextSpan(
                                text: Strings.author,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.accentBlueColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async => await canLaunch(
                                          Endpoints.dataSourceAuthorURL)
                                      ? launch(Endpoints.dataSourceAuthorURL)
                                      : throw 'Could not launch Refernce URL',
                              ),
                            ],
                          ),
                        ]),
                      ),
                      actions: <Widget>[
                        // Dialog Close Button
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth / 25,
                              vertical: screenHeight / 75,
                            ),
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(-2, 10),
                                  blurRadius: 10,
                                  color: AppColors.boxShadowColor,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(screenWidth / 25),
                              ),
                              color: AppColors.accentBlueColor,
                            ),
                            child: Text(
                              'Close',
                              style: TextStyles.statisticsHeadingTextStlye
                                  .copyWith(
                                fontSize: screenWidth / 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(-1, 1),
                        blurRadius: 2,
                        color: AppColors.boxShadowColor,
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(screenWidth / 15),
                    ),
                  ),
                  child: Icon(
                    Covid19Icons.error,
                    size: screenWidth / 12,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Settingt the background color to avoid the default
      // white color of the SafeArea widget
      backgroundColor: AppColors.preventionBackgroundColor,
      body: ScrollConfiguration(
        behavior: const CustomScrollBehaviour(),
        child: SingleChildScrollView(
          // Adding SafeArea to avoid the image being fullScreen
          // Padding been added to keep the VISME logo visible at the bottom
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.only(
                bottom: screenHeight / 20,
              ),
              color: AppColors.preventionBackgroundColor,
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: Endpoints.baseUrlPreventionInfographic,
                    cacheManager: ImageCacheManager(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // Floating Action Button used so that the item remains fixed when the image is scolled
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: screenHeight / 75,
        ),
        child: FloatingActionButton.extended(
          onPressed: () => Navigator.of(context).pop(),
          backgroundColor: AppColors.blackColor,
          isExtended: true,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          icon: Icon(
            Covid19Icons.keyboardArrowLeft,
            size: screenWidth / 20,
            color: AppColors.whiteColor,
          ),
          label: Text(
            'Go Back',
            style: TextStyles.infoLabelTextStyle,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
