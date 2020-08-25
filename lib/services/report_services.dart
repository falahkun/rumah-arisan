part of 'services.dart';

class ReportServices {
  static CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection("report_bug");

  static Future<void> reportBug(String report) async {
    try {
      String currentToken = await AuthServices.getCurrentSession();
      var date =
          DateTime.now().toString().replaceAll(" ", "").replaceAll("-", "");
      var docId = date.substring(0, 8) + "-" + date.substring(8, 16);
      _collectionReference.doc(docId).set({
        "uid": currentToken,
        "report_msg": report,
        "created_date": DateTime.now().toString(),
      });
    } catch (e) {
      return null;
    }
  }
}
