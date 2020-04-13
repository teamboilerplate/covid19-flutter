// import 'dart:math';
// import 'dart:ui';
// import 'package:flutter/material.dart';

// const Size kDefaultSize = Size.square(9.0);
// const EdgeInsets kDefaultSpacing = EdgeInsets.all(6.0);
// const ShapeBorder kDefaultShape = CircleBorder();

// /// Houses all the various attributes for the Dot Indicator under one
// /// Class offering customisability of the dots
// class DotsDecorator {
//   /// Inactive dot color
//   ///
//   /// @Default `Colors.grey`
//   final Color color;

//   /// Active dot color
//   ///
//   /// @Default `Colors.lightBlue`
//   final Color activeColor;

//   /// Inactive dot size
//   ///
//   /// @Default `Size.square(9.0)`
//   final Size size;

//   /// Active dot size
//   ///
//   /// @Default `Size.square(9.0)`
//   final Size activeSize;

//   /// Inactive dot shape
//   ///
//   /// @Default `CircleBorder()`
//   final ShapeBorder shape;

//   /// Active dot shape
//   ///
//   /// @Default `CircleBorder()`
//   final ShapeBorder activeShape;

//   /// Spacing between dots
//   ///
//   /// @Default `EdgeInsets.all(6.0)`
//   final EdgeInsets spacing;

//   const DotsDecorator({
//     this.color = Colors.grey,
//     this.activeColor = Colors.lightBlue,
//     this.size = kDefaultSize,
//     this.activeSize = kDefaultSize,
//     this.shape = kDefaultShape,
//     this.activeShape = kDefaultShape,
//     this.spacing = kDefaultSpacing,
//   })  : assert(color != null),
//         assert(activeColor != null),
//         assert(size != null),
//         assert(activeSize != null),
//         assert(shape != null),
//         assert(activeShape != null),
//         assert(spacing != null);
// }

// /// Adds a dot indicator when provided with
// ///
// /// 1. [dotsCount] - The total number of dots to be displayed
// /// 2. [positon] - The active positon of the  series of dots
// /// 3. [decorator] - [DotsDecorator] offering customizability of the dots
// /// 4. [axis] - The orientation of the series of dots - `Vertical`/`Horizontal`
// /// 5. [reversed] - The direction of series of dots - `ture -> Inverted` and `false -> Normal`
// class DotsIndicator extends StatelessWidget {
//   final int dotsCount;
//   final double position;
//   final DotsDecorator decorator;
//   final Axis axis;
//   final bool reversed;

//   const DotsIndicator({
//     Key key,
//     @required this.dotsCount,
//     this.position = 0.0,
//     this.decorator = const DotsDecorator(),
//     this.axis = Axis.horizontal,
//     this.reversed = false,
//   })  : assert(dotsCount != null && dotsCount > 0),
//         assert(position != null && position >= 0),
//         assert(decorator != null),
//         assert(
//           position < dotsCount,
//           "Position must be inferior than dotsCount",
//         ),
//         super(key: key);

//   // Creating a single dot in the series of dots
//   Widget _buildDot(int index) {
//     final state = min(1.0, (position - index).abs());

//     final size = Size.lerp(decorator.activeSize, decorator.size, state);
//     final color = Color.lerp(decorator.activeColor, decorator.color, state);
//     final shape = ShapeBorder.lerp(
//       decorator.activeShape,
//       decorator.shape,
//       state,
//     );

//     return Container(
//       width: size.width,
//       height: size.height,
//       margin: decorator.spacing,
//       decoration: ShapeDecoration(
//         color: color,
//         shape: shape,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Building and setting the direction of the dots based on the [axis] parameter provided
//     final dotsList = List<Widget>.generate(dotsCount, _buildDot);
//     final dots = reversed == true ? dotsList.reversed.toList() : dotsList;

//     // Setting the orientation of the dots based on the [axis] parameter provided
//     return axis == Axis.vertical
//         ? Column(mainAxisSize: MainAxisSize.min, children: dots)
//         : Row(mainAxisSize: MainAxisSize.min, children: dots);
//   }
// }
