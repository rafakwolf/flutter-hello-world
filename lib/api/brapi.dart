import 'package:http/http.dart' as http;

getStockData(String ticker) async {
  var response = await http
      .get(Uri.parse("https://brapi.dev/api/quote/$ticker?fundamental=true"));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception("Ops! algo saiu errado!");
  }
}

getStocksData(String tickers) async {
  var response = await http
      .get(Uri.parse("https://brapi.dev/api/quote/$tickers?fundamental=true"));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception("Ops! algo saiu errado!");
  }
}
