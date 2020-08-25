/// ini adalah baris untuk menambahkan packages
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rumah_arisan/models/models.dart';

/// ini adalah baris untuk menautkan halaman/file dalam folder services
part 'auth_services.dart';
part 'report_services.dart';

/// ini adalah baris untuk inisialisasi variable
Client client = Client();

/// ini adalah method untuk melakukan semua request yang akan digunakan nantinya
Future<Response> myRequest(String subUrl, {Map<String, dynamic> body}) async {
  return await client.post("https://rumaharisan.mascitra.co.id/api/$subUrl",
      body: body,
      headers: {'csrf-id': "xxx-app-xxx", "csrf-token": "xxx-token-xxx"});
}
