/// ini adalah baris untuk menambahkan packages
import 'dart:convert';
import 'package:http/http.dart';

/// ini adalah baris untuk menautkan halaman/file dalam folder services
part 'auth_services.dart';

/// ini adalah baris untuk inisialisasi variable
Client client = Client();

/// ini adalah method untuk melakukan semua request yang akan digunakan nantinya
Future<Response> myRequest(String subUrl, {Map<String, dynamic> body}) async {
  return await client.post("https://rumaharisan.mascitra.co.id/api/$subUrl",
      body: body,
      headers: {
        'csrf-id': "rumaharisan.com",
        "csrf-token": "ivL4hznuNg45eZvtDFNo1UypusxJISHywUt6dAX0M"
      });
}
