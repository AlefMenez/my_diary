import 'package:http/http.dart' as http;

class journalService {
  static const String url = "http://10.0.0.169:3000/";
  static const String resource = "learnhtttp/";

  String getUrl() {
    return "$url$resource";
  }

  register(String content) {
    http.post(Uri.parse(getUrl()), body: {"content": content});
  }

  Future<String> get() async {
    http.Response resposta = await http.get(Uri.parse(getUrl()));
    print(resposta.body);
    return resposta.body;
  }
}
