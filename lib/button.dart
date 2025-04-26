import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? title;
  final Color? color;
  final Color? borderColor;
  final Color? titleColor;
  final double? width;
  final double? height;
  final double? elevation;
  final double? fontSize;
  final String? icon;
  final EdgeInsetsGeometry? padding;
  final double? iconSize;
  final BoxFit fit;
  final BorderRadiusGeometry? borderRadius;
  final bool isLoading;
  final Color loadingColor;

  const MyButton({
    required this.onPressed,
    required this.title,
    this.color,
    this.borderColor,
    this.width,
    this.titleColor,
    this.height,
    this.elevation = 0,
    this.fontSize,
    this.icon,
    this.padding,
    this.iconSize,
    this.fit = BoxFit.contain,
    this.borderRadius,
    super.key,
    this.isLoading = false,
    this.loadingColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        width: width,
        height: height ?? 50,
        child: ElevatedButton.icon(
          onPressed: isLoading ? null : onPressed,
          style: ButtonStyle(
            side: WidgetStatePropertyAll(
              BorderSide(color: borderColor ?? Colors.transparent),
            ),
            backgroundColor: WidgetStateProperty.all(
              color ?? Colors.transparent,
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(40),
              ),
            ),
            elevation: WidgetStatePropertyAll(elevation),
          ),
          label:
              isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : FittedBox(
                    fit: fit,
                    child: Text(
                      title ?? '',
                      style: TextStyle(
                        color: titleColor ?? Colors.black,
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
        ),
      ),
    );
  }
}
