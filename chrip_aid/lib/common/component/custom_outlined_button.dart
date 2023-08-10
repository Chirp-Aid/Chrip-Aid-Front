import 'package:flutter/material.dart';
import 'package:chrip_aid/common/styles/styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  final void Function()? onPressed;

  final String text;

  final Color color;

  final double? elevation;
  final bool hasSide;
  final Size? fixedSize;

  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.color = CustomColor.buttonMainColor,
    this.elevation,
    this.hasSide = true,
    this.fixedSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusSize),
        ),
        minimumSize: kOutlinedButtonSize,
        fixedSize: fixedSize,
        side: BorderSide(
          color: hasSide ? Colors.white : CustomColor.buttonMainColor,
          width: kBorderWidth,
        ),
        elevation: elevation,
      ),
      child: Text(
        text,
        style: kTextReverseStyleMiddle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
