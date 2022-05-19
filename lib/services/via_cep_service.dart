import 'dart:convert' as convert;

import 'package:rcadmin_user/model/result_cep.dart';
import 'package:http/http.dart' as http;

class ViaCepService {
  static Future<ResultCep> fetchCep({String? cep}) async {
    var url = Uri.https('viacep.com.br', '/ws/$cep/json/');
    print(url);
    final response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return ResultCep.fromJson(jsonResponse);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
