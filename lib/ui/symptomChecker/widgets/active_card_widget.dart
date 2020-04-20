import 'package:flutter/material.dart';

/// [ActiveCardWidget] is Symptom Card which in focus
class ActiveCardWidget extends StatelessWidget {
  final int index;
  final double bottom;
  final double right;
  final double cardWidth;
  final double rotation;
  final double skew;
  final BuildContext context;
  final int flag;
  final Function swipeRight;

  const ActiveCardWidget({
    Key key,
    this.index,
    this.bottom,
    this.right,
    this.cardWidth,
    this.rotation,
    this.skew,
    this.context,
    this.flag,
    this.swipeRight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Positioned(
      bottom: bottom,
      left: right != 0.0 ? right : null,
      child: Transform(
        alignment: flag == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
        //transform: null,
        transform: Matrix4.skewX(skew),
        //..rotateX(-math.pi / rotation),
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(
            -rotation / 360,
          ),
          child: Card(
            color: Colors.transparent,
            elevation: 4.0,
            child: Container(
              alignment: Alignment.center,
              width: screenSize.width / 1.5 + cardWidth,
              height: screenSize.height / 2,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(121, 114, 173, 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: FlatButton(
                padding: const EdgeInsets.all(0.0),
                onPressed: () {
                  debugPrint('Entering in Active');
                  swipeRight(index);
                },
                child: Container(
                  height: 60.0,
                  width: 130.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: Text(
                    "I'M IN $index",
                    style: const TextStyle(color: Colors.white),
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
