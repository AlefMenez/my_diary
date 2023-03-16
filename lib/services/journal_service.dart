import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

import '../models/journal.dart';
import 'http_interceptors.dart';

class journalService {
  static const String url = "http://10.0.0.169:3000/";
  static const String resource = "journals/";
  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getUrl() {
    return "$url$resource";
  }

  Future<bool> register(Journal journal) async {
    String JsonJournal = json.encode(journal.toMap());
    http.Response response = await client.post(
      Uri.parse(getUrl()),
      headers: {
        'Content-type': 'application/json'
      },
      body: JsonJournal,
    );
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<String> get() async {
    http.Response resposta = await client.get(Uri.parse(getUrl()));
    print(resposta.body);
    return resposta.body;
  }
}
