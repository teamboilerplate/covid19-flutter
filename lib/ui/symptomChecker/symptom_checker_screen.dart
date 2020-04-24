import 'package:flutter/material.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/dimens.dart';
import 'package:covid19/constants/strings.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/icons/covid19_icons.dart';
import 'package:covid19/ui/symptomChecker/widgets/active_card_widget.dart';
import 'package:covid19/ui/symptomChecker/widgets/inactive_card_widget.dart';
import 'package:covid19/utils/custom_scroll_behaviour.dart';
import 'package:covid19/utils/device/device_utils.dart';
import 'package:covid19/widgets/sized_box_height_widget.dart';
import 'package:covid19/widgets/sized_box_width_widget.dart';

/// Screen to perform a simple test to give you information in regards
/// to Covid-19 Symptoms.
///
/// **NOTE** This information is not authorized by any health organisation
/// and shouldn't be considered as a fool proof test. Please consult your
/// doctor in case you witness any symptoms
class SymptomCheckerScreen extends StatefulWidget {
  @override
  _SymptomCheckerScreenState createState() => _SymptomCheckerScreenState();
}

class _SymptomCheckerScreenState extends State<SymptomCheckerScreen> {
  @override
  void initState() {
    super.initState();

    // Uncomment if you need a call back after the Hero Animation is over
    // and a task needs to be performed
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //Future.delayed(const Duration(seconds: 5), () =>

    //);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);
    return Hero(
      tag: 'symptomChecker',
      flightShuttleBuilder: (
        BuildContext flightContext,
        Animation<double> animation,
        HeroFlightDirection flightDirection,
        BuildContext fromHeroContext,
        BuildContext toHeroContext,
      ) {
        // Using a container with the same colour and radius as the [SymotomCheckerCardWidget] to ensure
        // a smooth Hero animation
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(screenWidth / 10),
            ),
            color: AppColors.primaryColor,
          ),
        );
      },
      child: Container(
        color: AppColors.primaryColor,

        // Wrapping the contents in [SafeArea] to avoid the Notch (When avaiable) and the bottom
        // navigation bar (Mostly comes in use for iOS Devices)
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: ScrollConfiguration(
              behavior: const CustomScrollBehaviour(),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    Dimens.horizontalPadding,
                    Dimens.verticalPadding / 0.75,
                    Dimens.horizontalPadding,
                    0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // Back Icon
                      IconButton(
                        // padding: const EdgeInsets.all(0),
                        icon: const Icon(
                          Covid19Icons.keyboardArrowLeft,
                        ),
                        iconSize: screenWidth / 12,
                        color: AppColors.whiteColor,
                        onPressed: () => Navigator.of(context).pop(),
                      ),

                      // Vertical Spacing
                      SizedBoxHeightWidget(screenHeight / 50),

                      // Wrapping other items inside a container to add extra padding
                      // to meet the default padding of Material Icons
                      Container(
                        padding: const EdgeInsets.only(
                          left: Dimens.horizontalPadding / 0.75,
                          right: Dimens.horizontalPadding / 0.75,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Symtpom Checker Heading
                            Text(
                              Strings.symptomCheckerTiitle,
                              style: TextStyles.symptonCheckerHeadingTextStyle
                                  .copyWith(
                                fontSize: screenWidth / 25,
                              ),
                            ),

                            // Vertical Spacing
                            SizedBoxHeightWidget(screenHeight / 100),

                            // Symptom Checker Disclaimer
                            Text(
                              Strings.disclaimerText,
                              style: TextStyles.symptonCheckerHeadingTextStyle
                                  .copyWith(
                                fontSize: screenWidth / 30,
                              ),
                            ),

                            // Vertical Spacing
                            SizedBoxHeightWidget(screenHeight / 35),
                          ],
                        ),
                      ),

                      // Stacked Cards of
                      Container(
                        height: screenHeight / 1.8,
                        child: const SymptomCheckerCards(),
                      ),

                      // Vertical Spacing
                      SizedBoxHeightWidget(screenHeight / 35),

                      // Question Progress and Count
                      QuestionProgressCount(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class QuestionProgressCount extends StatelessWidget {
  final double screenWidth, screenHeight;

  const QuestionProgressCount({Key key, this.screenWidth, this.screenHeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Questions Title
        Text(
          Strings.questiionsTitle,
          style: TextStyles.symptonCheckerHeadingTextStyle.copyWith(
            fontSize: screenWidth / 10,
          ),
        ),

        // Question Progress Count
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Question Progress Bar
            Stack(
              children: <Widget>[
                Container(
                  width: screenWidth / 1.5,
                  height: screenHeight / 100,
                  decoration: BoxDecoration(
                    color: AppColors.offWhiteColor.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: screenWidth / 5.7,
                  height: screenHeight / 100,
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                )
              ],
            ),

            // Horizontal Spacing
            SizedBoxWidthWidget(screenWidth / 35),

            // Question Progress Count
            Expanded(
              child: RichText(
                softWrap: true,
                maxLines: 2,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '1',
                      style: TextStyles.symptonCheckerHeadingTextStyle.copyWith(
                        fontSize: screenWidth / 15,
                      ),
                    ),
                    TextSpan(
                      text: '/10',
                      style:
                          TextStyles.symptonCheckerSubHeadingTextStyle.copyWith(
                        fontSize: screenWidth / 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SymptomCheckerCards extends StatefulWidget {
  const SymptomCheckerCards({Key key}) : super(key: key);

  @override
  _SymptomCheckerCardsState createState() => _SymptomCheckerCardsState();
}

class _SymptomCheckerCardsState extends State<SymptomCheckerCards>
    with TickerProviderStateMixin {
  AnimationController _buttonController;
  Animation<double> rotate;
  Animation<double> right;
  Animation<double> bottom;
  Animation<double> width;

  List data = [
    const SymptomQuestionCard(
      index: 0,
      color: AppColors.deadColor,
    ),
    const SymptomQuestionCard(
      index: 1,
      color: AppColors.accentColor,
    ),
    const SymptomQuestionCard(
      index: 2,
      color: AppColors.secondaryAccentColor,
    ),
    const SymptomQuestionCard(
      index: 3,
      color: AppColors.blackColor,
    ),
    const SymptomQuestionCard(
      index: 4,
      color: AppColors.deadColor,
    ),
    const SymptomQuestionCard(
      index: 5,
      color: AppColors.accentColor,
    ),
  ];

  @override
  void initState() {
    super.initState();

    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    rotate = Tween<double>(
      begin: -0.0,
      end: -40.0,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    rotate.addListener(
      () {
        setState(
          () {
            if (rotate.isCompleted) {
              final i = data.removeLast();
              data.insert(0, i);

              _buttonController.reset();
            }
          },
        );
      },
    );

    right = Tween<double>(
      begin: 0.0,
      end: 400.0,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    bottom = Tween<double>(
      begin: 15.0,
      end: 100.0,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  Future<void> _swipeAnimation() async {
    try {
      await _buttonController.forward();
    } on TickerCanceled {
      _buttonController.stop();
    }
  }

  Future<void> swipeRight(int index) async {
    await _swipeAnimation();
    setState(() {
      data.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    const double initialBottom = 15.0;
    final dataLength = data.length;
    double backCardPosition = initialBottom + (dataLength - 1) * 10 + 10;
    double backCardWidth = -10.0;
    return Container(
      child: dataLength > 0
          ? Stack(
              alignment: AlignmentDirectional.center,
              children: data.map(
                (item) {
                  if (data.indexOf(item) == dataLength - 1) {
                    return ActiveCardWidget(
                      index: data.indexOf(item),
                      bottom: bottom.value,
                      right: right.value,
                      cardWidth: backCardWidth + 10,
                      rotation: rotate.value,
                      skew: rotate.value < -10 ? 0.1 : 0.0,
                      context: context,
                      swipeRight: swipeRight,
                    );
                  } else {
                    backCardPosition = backCardPosition - 10;
                    backCardWidth = backCardWidth + 10;

                    return InActiveCardWidget(
                      index: data.indexOf(item),
                      bottom: backCardPosition,
                      cardWidth: backCardWidth,
                      rotation: 0.0,
                    );
                  }
                },
              ).toList())
          : const Center(
              child: Text(
                "Your Result",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                ),
              ),
            ),
    );
  }
}

class SymptomQuestionCard extends StatelessWidget {
  final int index;
  final Color color;

  const SymptomQuestionCard({
    Key key,
    this.index,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 250,
      color: color,
      child: Center(
        child: Text(
          '$index',
        ),
      ),
    );
  }
}
