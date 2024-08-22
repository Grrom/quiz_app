import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stamp_card/modules/home/models/quiz_category.dart';
import 'package:http/http.dart' show Client, Response;

class QuizService extends GetxService {
  String url = 'https://grrom.github.io/files/astronomy_quiz.json';
  final Client _client = Client();

  Future<List<QuizCategory>> getQuizCategories() async {
    Uri uri = Uri.parse(url);

    final Response response = await _client.get(uri, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> astronomyJson = json.decode(response.body);
      return [QuizCategory.fromJson(astronomyJson)];
    } else {
      throw Exception('Failed to load products');
    }
  }
}
