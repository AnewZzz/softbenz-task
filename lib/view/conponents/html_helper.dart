import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' show parse;

import '../../view_model/utils/colors.dart';

class HtmlHelper {
  Html customSizesHtml(
      {required String data,
      FontStyle? fontStyle,
      FontSize? fontSize,
      TextOverflow? textOverflow,
      TextAlign? textAlign,
      int? maxlines,
      LineHeight? lineHeight,
      Function(String?)? onAnchorTagTap,
      FontWeight? fontWeight,
      Function()? onLinkTap,
      Color? color,
      HtmlPaddings? padding,
      Margins? margin,
      double? wordSpacing}) {
    return Html(
      data: data,
      onAnchorTap: (value, map, element) {
        onAnchorTagTap?.call(value);
      },
      onLinkTap: (url, attributes, element) {
        onLinkTap?.call();
      },
      style: {
        "h1": Style(
            margin: margin ?? Margins.zero,
            textOverflow: textOverflow ?? TextOverflow.visible,
            wordSpacing: wordSpacing ?? 0,
            padding: padding ??
                HtmlPaddings.only(left: 10, top: 10, right: 10, bottom: 0),
            fontSize: fontSize ?? FontSize(12.0),
            fontWeight: fontWeight ?? FontWeight.normal,
            fontStyle: fontStyle ?? FontStyle.italic,
            fontFamily: 'Poppins',
            maxLines: maxlines,
            lineHeight: lineHeight ?? const LineHeight(1.5),
            height: Height(45),
            whiteSpace: WhiteSpace.normal,
            color: color ?? AppColor.darkCharcoal,
            textAlign: textAlign ?? TextAlign.start),
        "span": Style(
            margin: margin ?? Margins.zero,
            textOverflow: textOverflow ?? TextOverflow.visible,
            wordSpacing: wordSpacing ?? 0,
            padding: padding ??
                HtmlPaddings.only(left: 10, top: 10, right: 10, bottom: 0),
            fontSize: fontSize ?? FontSize(12.0),
            fontWeight: fontWeight ?? FontWeight.normal,
            fontStyle: fontStyle ?? FontStyle.italic,
            fontFamily: 'Poppins',
            maxLines: maxlines,
            lineHeight: lineHeight ?? const LineHeight(1.5),
            height: Height(45),
            whiteSpace: WhiteSpace.normal,
            color: color ?? AppColor.darkCharcoal,
            textAlign: textAlign ?? TextAlign.start),
        "div": Style(
            margin: margin ?? Margins.zero,
            textOverflow: textOverflow ?? TextOverflow.visible,
            wordSpacing: wordSpacing ?? 0,
            padding: padding ??
                HtmlPaddings.only(left: 10, top: 10, right: 10, bottom: 0),
            fontSize: fontSize ?? FontSize(12.0),
            fontWeight: fontWeight ?? FontWeight.normal,
            fontStyle: fontStyle ?? FontStyle.italic,
            fontFamily: 'Poppins',
            maxLines: maxlines,
            lineHeight: lineHeight ?? const LineHeight(1.5),
            height: Height(45),
            whiteSpace: WhiteSpace.normal,
            color: color ?? AppColor.darkCharcoal,
            textAlign: textAlign ?? TextAlign.start),
        "h2": Style(
            margin: margin ?? Margins.zero,
            wordSpacing: wordSpacing ?? 0,
            padding: padding ??
                HtmlPaddings.only(left: 10, top: 10, right: 10, bottom: 0),
            fontSize: fontSize ?? FontSize(12.0),
            fontWeight: fontWeight ?? FontWeight.normal,
            fontStyle: fontStyle ?? FontStyle.italic,
            fontFamily: 'Poppins',
            maxLines: maxlines,
            lineHeight: lineHeight ?? const LineHeight(1.5),
            height: Height(45),
            whiteSpace: WhiteSpace.normal,
            textOverflow: textOverflow ?? TextOverflow.visible,
            color: color ?? AppColor.darkCharcoal,
            textAlign: textAlign ?? TextAlign.start),
        "h3": Style(
            margin: margin ?? Margins.zero,
            wordSpacing: wordSpacing ?? 0,
            padding: padding ??
                HtmlPaddings.only(left: 10, top: 10, right: 10, bottom: 0),
            fontSize: fontSize ?? FontSize(12.0),
            fontWeight: fontWeight ?? FontWeight.normal,
            fontStyle: fontStyle ?? FontStyle.italic,
            fontFamily: 'Poppins',
            maxLines: maxlines,
            lineHeight: lineHeight ?? const LineHeight(1.5),
            height: Height(45),
            whiteSpace: WhiteSpace.normal,
            textOverflow: textOverflow ?? TextOverflow.visible,
            color: color ?? AppColor.darkCharcoal,
            textAlign: textAlign ?? TextAlign.start),
        "li": Style(
            margin: margin ?? Margins.zero,
            wordSpacing: wordSpacing ?? 0,
            padding: padding ?? HtmlPaddings.symmetric(vertical: 1.5),
            fontSize: fontSize ?? FontSize(12.0),
            fontWeight: fontWeight ?? FontWeight.normal,
            fontStyle: fontStyle ?? FontStyle.italic,
            textOverflow: textOverflow ?? TextOverflow.visible,
            fontFamily: 'Poppins',
            maxLines: maxlines,
            lineHeight: lineHeight ?? const LineHeight(1.75),
            color: color ?? AppColor.darkCharcoal,
            textAlign: textAlign ?? TextAlign.start),
        "ul": Style(
            margin: margin ?? Margins.zero,
            wordSpacing: wordSpacing ?? 0,
            padding: padding ?? HtmlPaddings.zero,
            fontSize: fontSize ?? FontSize(12.0),
            fontWeight: fontWeight ?? FontWeight.normal,
            fontStyle: fontStyle ?? FontStyle.italic,
            textOverflow: textOverflow ?? TextOverflow.visible,
            fontFamily: 'Poppins',
            maxLines: maxlines,
            lineHeight: lineHeight ?? const LineHeight(1.5),
            color: color ?? AppColor.darkCharcoal,
            textAlign: textAlign ?? TextAlign.start),
        "body": Style(
            margin: margin ?? Margins.zero,
            wordSpacing: wordSpacing ?? 0,
            padding: padding ?? HtmlPaddings.zero,
            fontSize: fontSize ?? FontSize(12.0),
            fontWeight: fontWeight ?? FontWeight.normal,
            fontStyle: fontStyle ?? FontStyle.italic,
            textOverflow: textOverflow ?? TextOverflow.visible,
            fontFamily: 'Poppins',
            maxLines: maxlines,
            lineHeight: lineHeight ?? const LineHeight(1.75),
            color: color ?? AppColor.darkCharcoal,
            textAlign: textAlign ?? TextAlign.start),
        "p": Style(
            margin: margin ?? Margins.zero,
            wordSpacing: wordSpacing ?? 0,
            padding: padding ?? HtmlPaddings.zero,
            fontSize: fontSize ?? FontSize(12.0),
            fontWeight: fontWeight ?? FontWeight.normal,
            fontStyle: fontStyle ?? FontStyle.italic,
            textOverflow: textOverflow ?? TextOverflow.visible,
            fontFamily: 'Poppins',
            maxLines: maxlines,
            lineHeight: lineHeight ?? const LineHeight(1.75),
            color: color ?? AppColor.darkCharcoal,
            textAlign: textAlign ?? TextAlign.start),
        "strong": Style(
            margin: margin ?? Margins.zero,
            wordSpacing: wordSpacing ?? 0,
            padding: padding ?? HtmlPaddings.zero,
            fontSize: fontSize ?? FontSize(12.0),
            fontWeight: fontWeight ?? FontWeight.bold,
            fontStyle: fontStyle ?? FontStyle.italic,
            textOverflow: textOverflow ?? TextOverflow.visible,
            fontFamily: 'Poppins',
            maxLines: maxlines,
            lineHeight: lineHeight ?? const LineHeight(1.75),
            color: color ?? AppColor.darkCharcoal,
            textAlign: textAlign ?? TextAlign.start),
        "a": Style(
          color: AppColor.primary,
        ),
      },
    );
  }
}

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;
  return parsedString;
}
