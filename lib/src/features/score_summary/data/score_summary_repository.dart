import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ScoreSummaryRepository {
  Future<dynamic> fetchScoreSummary(String id) async {
    try {
      var response = await http.get(Uri.parse(
          'https://demo.entitysport.com/wp-admin/admin-ajax.php?action=wpec_api_request&path=matches%$id%2Fstatistics'));
      print('response: ${response.body}');
      var resp = json.decode(response.body);
      print('resp: $resp');
      return resp;
    } catch (e) {
      print('error');
      throw Exception('something went wrong');
    }
  }
}

final scoreSummaryProvider = Provider<ScoreSummaryRepository>((ref) {
  return ScoreSummaryRepository();
});

final fetchScoreSummaryProvider =
    FutureProvider.family<dynamic, String>((ref, id) async {
  final scoreSummaryRepository = ref.watch(scoreSummaryProvider);

  return scoreSummaryRepository.fetchScoreSummary(id);
});
