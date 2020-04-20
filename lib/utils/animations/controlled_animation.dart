import 'package:flutter/widgets.dart';

/// Widget to create custom, managed, tween-based animations in a very simple way.
///
/// ---
///
/// An internal [AnimationController] will do everything you tell him by
/// dynamically assigning the one [Playback] to [playback] property.
/// By default the animation will start playing forward and stops at the end.
///
/// A minimum set of properties are [duration] (time span of the animation),
/// [tween] (values to interpolate among the animation) and a [builder] function
/// (defines the animated scene).
///
/// Instead of using [builder] as building function you can use for performance
/// critical scenarios [builderWithChild] along with a prebuild [child].
///
/// ---
///
/// The following properties are optional:
///
/// - You can apply a [delay] that forces the animation to pause a
///   specified time before the animation will perform the defined [playback]
///   instruction.
///
/// - You can specify a [curve] that modifies the [tween] by applying a
///   non-linear animation function. You can find curves in [Curves], for
///   example [Curves.easeOut] or [Curves.easeIn].
///
/// - You can track the animation by setting an [AnimationStatusListener] to
///   the property [animationControllerStatusListener]. The internal [AnimationController] then
///   will route out any events that occur. [ControlledAnimation] doesn't filter
///   or modifies these events. These events are currently only reliable for the
///   [playback]-types [Playback.PLAY_FORWARD] and [Playback.PLAY_REVERSE].
///
/// - You can set the start position of animation by specifying [startPosition]
///   with a value between *0.0* and *1.0*. The [startPosition] is only
///   evaluated once during the initialization of the widget.
///
class ControlledAnimation<T> extends StatefulWidget {
  final Animatable<T> tween;
  final Curve curve;
  final Duration duration;
  final Duration delay;
  final Widget Function(BuildContext buildContext, T animatedValue) builder;
  final Widget Function(BuildContext, Widget child, T animatedValue)
      builderWithChild;
  final Widget child;
  final AnimationStatusListener animationControllerStatusListener;
  final double startPosition;

  const ControlledAnimation({
    @required this.tween,
    this.curve = Curves.linear,
    @required this.duration,
    this.delay,
    this.builder,
    this.builderWithChild,
    this.child,
    this.animationControllerStatusListener,
    this.startPosition = 0.0,
    Key key,
  })  : assert(duration != null,
            "Please set property duration. Example: Duration(milliseconds: 500)"),
        assert(tween != null,
            "Please set property tween. Example: Tween(from: 0.0, to: 100.0)"),
        assert(
            (builderWithChild != null && child != null && builder == null) ||
                (builder != null && builderWithChild == null && child == null),
            "Either use just builder and keep buildWithChild and child null. "
            "Or keep builder null and set a builderWithChild and a child."),
        assert(
            startPosition >= 0 && startPosition <= 1,
            "The property startPosition "
            "must have a value between 0.0 and 1.0."),
        super(key: key);

  @override
  _ControlledAnimationState<T> createState() => _ControlledAnimationState<T>();
}

class _ControlledAnimationState<T> extends State<ControlledAnimation<T>>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<T> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() {
        setState(() {});
      })
      ..value = widget.startPosition;

    _animation = widget.tween
        .chain(CurveTween(curve: widget.curve))
        .animate(_controller);

    if (widget.animationControllerStatusListener != null) {
      _controller.addStatusListener(widget.animationControllerStatusListener);
    }

    initialize();
    super.initState();
  }

  Future<void> initialize() async {
    if (widget.delay != null) {
      await Future.delayed(widget.delay);
    }
  }

  @override
  void didUpdateWidget(ControlledAnimation<T> oldWidget) {
    _controller.duration = widget.duration;

    _animation = widget.tween
        .chain(CurveTween(curve: widget.curve))
        .animate(_controller);

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.builder != null) {
      return widget.builder(context, _animation.value);
    } else if (widget.builderWithChild != null && widget.child != null) {
      return widget.builderWithChild(context, widget.child, _animation.value);
    }
    return Container();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
