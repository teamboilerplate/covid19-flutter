import 'package:flutter/material.dart';
import 'package:covid19/constants/colors.dart';
import 'package:covid19/constants/dimens.dart';
import 'package:covid19/constants/strings.dart';
import 'package:covid19/constants/text_styles.dart';
import 'package:covid19/data/faq_data.dart';
import 'package:covid19/icons/covid19_icons.dart';
import 'package:covid19/models/faq/faq_model.dart';
import 'package:covid19/utils/custom_scroll_behaviour.dart';
import 'package:covid19/utils/device/device_utils.dart';
import 'package:covid19/widgets/sized_box_height_widget.dart';

class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  // final List<Item> _data = generateItems(8);
  int _previousItemIndex = -1;

  Widget _buildPanel({
    double screenWidth,
    double screenHeight,
  }) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        if (_previousItemIndex == -1) {
          setState(() {
            _previousItemIndex = index;
            faqData[index].isExpanded = !isExpanded;
          });
        } else {
          setState(() {
            faqData[_previousItemIndex].isExpanded = false;
            faqData[index].isExpanded = !isExpanded;
            _previousItemIndex = index;
          });
        }
      },
      children: faqData.map<ExpansionPanel>((FAQModel item) {
        return ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                item.title,
                style: TextStyles.faqHeadingTextStyle.copyWith(
                  fontSize: screenHeight / 50,
                ),
              ),
            );
          },
          body: ListTile(
            title: Padding(
              padding: EdgeInsets.only(
                bottom: screenHeight / 30,
              ),
              child: Text(
                item.description,
                style: TextStyles.faqBodyTextStyle.copyWith(
                  fontSize: screenHeight / 55,
                ),
              ),
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScaledWidth(context, 1);
    final screenHeight = DeviceUtils.getScaledHeight(context, 1);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      // [AppBar] with 0 size used to set the statusbar background color and
      // statusbat text/icon color
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: AppColors.transparentColor,
          brightness: Brightness.light,
          elevation: 0.0,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Dimens.horizontalPadding,
            Dimens.verticalPadding / 0.75,
            Dimens.horizontalPadding,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                Strings.faqTitle,
                style: TextStyles.statisticsHeadingTextStlye.copyWith(
                  fontSize: screenHeight / 35,
                ),
              ),
              // Symptom Items
              // Wrapping the contents in a [Flexible] to make sure that the remaining space
              // in the screen is filled (Removing this causes the overflow error to occur as
              // a column does not allow scrolling inherently)
              Flexible(
                // Defining a [SingleChildScrollView] to scroll only the Symptom Items and not the header
                child: ScrollConfiguration(
                  behavior: const CustomScrollBehaviour(),
                  child: SingleChildScrollView(
                    child: _buildPanel(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    ),
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
