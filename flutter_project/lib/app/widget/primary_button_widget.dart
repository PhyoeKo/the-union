import 'package:flutter/material.dart';
import '../constant/resources/app_colors.dart';

class PrimaryButtonWidget extends StatefulWidget {
  final Function? onPress;
  final Color bgColor;
  final Color borderColor;
  final Widget? child;
  final double? height;
  final double radiusFactor;
  final double borderSize;

  const PrimaryButtonWidget({
    required this.onPress,
    this.bgColor = AppColors.primaryColor,
    this.borderColor = Colors.transparent,
    this.child,
    this.height = 48,
    this.radiusFactor = 0.2,
    this.borderSize = 1,
    Key? key,
  }) : super(key: key);

  @override
  _PrimaryButtonWidgetState createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: widget.height,
      onPressed: () => widget.onPress == null ? null : widget.onPress!(),
      child: widget.child ?? const SizedBox(),
      color: widget.bgColor,
      highlightElevation: 0,
      highlightColor: AppColors.colorAccent.withOpacity(0.1),
      splashColor:  AppColors.colorAccent.withOpacity(0.1),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          widget.height! * widget.radiusFactor,
        ),
        side: BorderSide(
          width: widget.borderSize,
          color: widget.borderColor,
        ),
      ),
    );
  }
}
