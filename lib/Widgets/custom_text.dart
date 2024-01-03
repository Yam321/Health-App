import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  final String? textData;
  final Color? textColor;
  final FontWeight? fontWeight;
  final int? maxLines;
  final bool? underLine;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? padding;

  final TextOverflow? textOverflow;
  final MainAxisAlignment? mainAxisAlignment;
  final double? textStyleHeight;
  final double? fontSize;

  const CustomText(
      {Key? key,
      this.textData,
      this.textColor,
    
      this.fontWeight,
      this.maxLines,
      this.underLine,
      this.textAlign,
      this.textOverflow,
      this.padding,
      this.textStyleHeight,
      this.mainAxisAlignment,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget text = Text(
      
      textData ?? "Empty text",
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: TextStyle(
        height: textStyleHeight,

        decoration: underLine != null ? TextDecoration.underline : null,
        fontSize: fontSize,
        // fontSize: widget.size! * MediaQuery.textScaleFactorOf(context),
        fontWeight: fontWeight ?? FontWeight.w500,
        color: textColor,
      ),
    );
    return Padding(padding: padding ?? EdgeInsets.zero, child: text);
  }
}
