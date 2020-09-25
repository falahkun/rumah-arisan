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

String placeHolderImageUrl(String placeName) {
  return "https://ui-avatars.com/api/?background=2C98F0&color=fff&name=$placeName";
}

String lorem =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ";

String gettingFirstChar(String title) {
  var splittedTitle = title.split(" ");
  if (splittedTitle.length > 1) {
    String firstWord = splittedTitle.first;
    return firstWord.substring(0, 1);
  } else {
    return title.substring(0, 1);
  }
}

bool isEnteredTitle(String title) {
  var splittedTitle = title.split(" ");
  if (splittedTitle.length > 1) {
    return true;
  } else {
    return false;
  }
}

String priceFormating(String price) {
  var f = NumberFormat("#,##0", "en_US");
  return "Rp " + f.format(int.parse(price ?? "0"));
}
