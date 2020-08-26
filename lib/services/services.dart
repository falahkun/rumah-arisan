/// ini adalah baris untuk menambahkan packages
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

/// ini adalah baris untuk menautkan halaman/file dalam folder services
part 'auth_services.dart';
part 'report_services.dart';
part 'remote_config_service.dart';
part 'fcm_services.dart';

/// ini adalah baris untuk inisialisasi variable
Client client = Client();

/// ini adalah method untuk melakukan semua request yang akan digunakan nantinya
Future<Response> myRequest(String subUrl, {Map<String, dynamic> body}) async {

  var headers = await RemoteConfigService.getHeaders();
  var baseUrl = await RemoteConfigService.getBaseUrl();

  print("$baseUrl - $headers");
  return await client.post("$baseUrl/$subUrl",
      body: body,
      headers: {
        'csrf-id':headers['csrf-id'],
        'csrf-token':headers['csrf-token']
      });
}
