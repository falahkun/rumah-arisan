part of 'shareds.dart';

TextStyle regular =
    GoogleFonts.notoSans(fontWeight: FontWeight.w400, fontSize: 12);
TextStyle bold =
    GoogleFonts.notoSans(fontWeight: FontWeight.w700, fontSize: 14);

PageEvent prevPageEvent;

String privacy(bool isPrivate) {
  if (isPrivate) {
    return "Private";
  } else {
    return "Public";
  }
}

String noHtmlHtmlan(String stringWithHtmltag) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return stringWithHtmltag.replaceAll(exp, '');
}

String expandText(String text, {bool isExpand = false, int maxLength = 50}) {
  if (isExpand) {
    return text;
  } else {
    if (text.length > maxLength) {
      return text.substring(0, maxLength) + "...";
    } else {
      return text;
    }
  }
}
