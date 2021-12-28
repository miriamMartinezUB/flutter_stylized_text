import 'package:flutter/widgets.dart';
import 'package:flutter_stylized_text/resources/constants.dart' as CONSTANTS;

class FlutterStylizedText extends StatelessWidget {
  final String text;
  final Color color;
  final Color? stylizedTextColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String? fontFamily;

  const FlutterStylizedText(
      {Key? key,
      required this.text,
      required this.color,
      this.stylizedTextColor,
      required this.fontSize,
      required this.fontWeight,
      this.textAlign = TextAlign.start,
      this.fontFamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: _createTextSpans(text),
      ),
      textAlign: textAlign,
    );
  }

  List<TextSpan> _createTextSpans(String content) {
    List<TextSpan> result = [];
    List<String> splitContentList = _generateElements(content);
    for (String text in splitContentList) {
      result.add(getStylizedText(text));
    }
    return result;
  }

  TextSpan getStylizedText(String text) {
    final match = RegExp(CONSTANTS.regExpPattern).firstMatch(text);
    TextStyle textStyle = TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight, fontFamily: fontFamily);
    if (match?.groupCount == 2) {
      text = match!.group(1)!;
      String style = match.group(2)!.trim().toUpperCase();
      if (style.contains(CONSTANTS.UNDERLINED) && style.contains(CONSTANTS.LINE_THROUGH)) {
        throw Exception('400 - Bad request: You can not put underline(U) and line through(IT) at same time');
      }

      if (style.contains(CONSTANTS.COLORED)) {
        textStyle = textStyle.copyWith(color: _stylizedTextColor());
      }
      if (style.contains(CONSTANTS.ITALIC)) {
        textStyle = textStyle.copyWith(fontStyle: FontStyle.italic);
      }
      if (style.contains(CONSTANTS.BOLD)) {
        textStyle = textStyle.copyWith(fontWeight: FontWeight.bold);
      }
      if (style.contains(CONSTANTS.UNDERLINED)) {
        textStyle = textStyle.copyWith(decoration: TextDecoration.underline);
      }
      if (style.contains(CONSTANTS.LINE_THROUGH)) {
        textStyle = textStyle.copyWith(decoration: TextDecoration.lineThrough);
      }
    }
    return TextSpan(text: text, style: textStyle);
  }

  Color _stylizedTextColor() => stylizedTextColor == null ? color : stylizedTextColor!;

  List<String> _generateElements(String text) {
    if (text.isEmpty) return [];

    List<String> elements = [];

    final matches = RegExp(CONSTANTS.regExpPattern).allMatches(text);

    if (matches.isEmpty) {
      elements.add(
        text,
      );
    } else {
      var index = 0;
      matches.forEach((match) {
        if (match.start != 0) {
          elements.add(
            text.substring(index, match.start),
          );
        }
        elements.add(match.group(0)!);
        index = match.end;
      });

      if (index < text.length) {
        elements.add(
          text.substring(index),
        );
      }
    }
    return elements;
  }
}
