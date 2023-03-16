import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

import 'http_interceptors.dart';


class journalService {
  static const String url = "http://10.0.0.169:3000/";
  static const String resource = "learnhtttp/";
  http.Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getUrl() {
    return "$url$resource";
  }

  register(String content) {
    client.post(Uri.parse(getUrl()), body: {"content": content});
  }

  Future<String> get() async {
    http.Response resposta = await client.get(Uri.parse(getUrl()));
    print(resposta.body);
    return resposta.body;
  }
}
