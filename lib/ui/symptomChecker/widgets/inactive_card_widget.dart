import 'package:flutter/material.dart';

/// [InActiveCardWidget] is Symptom Card which in focus
class InActiveCardWidget extends StatelessWidget {
  final int index;
  final double bottom;
  final double cardWidth;
  final double rotation;
  final double skew;

  const InActiveCardWidget(
      {Key key,
      this.index,
      this.bottom,
      this.cardWidth,
      this.rotation,
      this.skew})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Positioned(
      bottom: bottom,
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
              debugPrint('Entering in Dummy');
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
    );
  }
}
