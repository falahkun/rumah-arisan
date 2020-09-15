import 'dart:async';

/// ini adalah baris untuk menambahkan packages
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rumah_arisan/models/models.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:uni_links/uni_links.dart';

/// ini adalah baris untuk menautkan halaman/file dalam folder services
part 'auth_services.dart';
part 'report_services.dart';
part 'remote_config_service.dart';
part 'fcm_services.dart';
part 'cloter_services.dart';
part 'slider_services.dart';
part 'unilink_services.dart';
part 'subdistrict_services.dart';
part 'category_services.dart';
part 'community_services.dart';

/// ini adalah method untuk melakukan semua request yang akan digunakan nantinya
Future<http.Response> postRequest(String subUrl,
    {Map<String, String> body, String memberToken}) async {
  var headers = await RemoteConfigService.getHeaders();
  var baseUrl = await RemoteConfigService.getBaseUrl();

  // print("$baseUrl - $headers");
  http.Request rq = http.Request('POST', Uri.parse("$baseUrl/$subUrl"))
    ..bodyFields = body;
  rq.headers.addAll({
    'csrf-id': headers['csrf-id'],
    'csrf-token': headers['csrf-token'],
    'member-token': memberToken ?? '',
  });

  // rq.bodyFields.addAll(body);
  http.StreamedResponse streamedResponse = await http.Client().send(rq);
  return http.Response.fromStream(streamedResponse);
}

Future<http.Response> getRequest(String subUrl, {String memberToken}) async {
  var headers = await RemoteConfigService.getHeaders();
  var baseUrl = await RemoteConfigService.getBaseUrl();

  // print("$baseUrl - $headers");
  http.Request rq = http.Request('GET', Uri.parse("$baseUrl/$subUrl"));
  rq.headers.addAll({
    'csrf-id': headers['csrf-id'],
    'csrf-token': headers['csrf-token'],
    'member-token': memberToken ?? ''
  });

  http.StreamedResponse streamedResponse = await http.Client().send(rq);
  return http.Response.fromStream(streamedResponse);
}

Future<http.Response> putRequest(String subUrl,
    {Map<String, String> body, String memberToken}) async {
  var headers = await RemoteConfigService.getHeaders();
  var baseUrl = await RemoteConfigService.getBaseUrl();

  // print("$baseUrl - $headers");
  http.Request rq = http.Request('PUT', Uri.parse("$baseUrl/$subUrl"))
    ..bodyFields = body;
  rq.headers.addAll({
    'csrf-id': headers['csrf-id'],
    'csrf-token': headers['csrf-token'],
    'member-token': memberToken ?? ''
  });

  // rq.bodyFields.addAll(body);
  http.StreamedResponse streamedResponse = await http.Client().send(rq);
  return http.Response.fromStream(streamedResponse);
}

Future<http.Response> deleteRequest(String subUrl,
    {Map<String, String> body, String memberToken}) async {
  var headers = await RemoteConfigService.getHeaders();
  var baseUrl = await RemoteConfigService.getBaseUrl();

  // print("$baseUrl - $headers");
  http.Request rq = http.Request('DELETE', Uri.parse("$baseUrl/$subUrl"))
    ..bodyFields = body;
  rq.headers.addAll({
    'csrf-id': headers['csrf-id'],
    'csrf-token': headers['csrf-token'],
    'member-token': memberToken ?? '',
    // "Content-Type": "",
    HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
    // "Content-Length": "${body.length}",
  });

  print(body.length);

  http.StreamedResponse streamedResponse = await http.Client().send(rq);
  return http.Response.fromStream(streamedResponse);
}
