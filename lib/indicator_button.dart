library indicator_button;


import 'package:flutter/material.dart';

typedef FutureVoidCallback = Future<void> Function();

/// A Flutter Button with indicates progress
class IndicatorButton extends StatefulWidget {
  final FutureVoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;
  final Color progressColor;
  final Color borderColor;

  IndicatorButton({
    Key key,
    @required this.onPressed,
    this.child,
    this.backgroundColor,
    this.progressColor,
    this.borderColor,
  })  : assert(onPressed != null),
        super(key: key);

  @override
  _IndicatorButtonState createState() => _IndicatorButtonState();
}

class _IndicatorButtonState extends State<IndicatorButton>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _animation;
  bool _progressing = false;

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );
    _animation = TweenSequence<Offset>([
      TweenSequenceItem<Offset>(
          tween: Tween(begin: Offset(0, 0), end: Offset(0.03, 0)), weight: 1),
      TweenSequenceItem<Offset>(
          tween: Tween(begin: Offset(0.03, 0), end: Offset(-0.03, 0)),
          weight: 2),
      TweenSequenceItem<Offset>(
          tween: Tween(begin: Offset(-0.03, 0), end: Offset(0.03, 0)),
          weight: 2),
      TweenSequenceItem<Offset>(
          tween: Tween(begin: Offset(0.03, 0), end: Offset(-0.03, 0)),
          weight: 2),
      TweenSequenceItem<Offset>(
          tween: Tween(begin: Offset(-0.03, 0), end: Offset(0, 0)), weight: 1)
    ]).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        widget.backgroundColor ?? Theme.of(context).primaryColor;
    Color borderColor = widget.borderColor ?? Theme.of(context).primaryColor;
    Color progressColor = widget.progressColor ?? Colors.white;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          position: _animation,
          child: LayoutBuilder(
            builder: (context, constraints) {
              var buttonHeight = constraints.maxHeight;
              if (buttonHeight == double.infinity) {
                buttonHeight = 40;
              }
              Widget buttonContent = widget.child ?? Container();
              if (_progressing) {
                buttonContent = SizedBox(
                  height: buttonHeight,
                  width: buttonHeight,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          progressColor ?? Colors.white),
                      strokeWidth: 3,
                    ),
                  ),
                );
              }

              return AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return FlatButton(
                    child: buttonContent,
                    onPressed: () async {
                      setState(
                            () {
                          _progressing = true;
                        },
                      );
                      await widget.onPressed();
                      setState(
                            () {
                          _progressing = false;
                        },
                      );
                    },
                    color: backgroundColor,
                    shape: Border.all(color: borderColor),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
