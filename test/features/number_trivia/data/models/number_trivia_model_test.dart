import 'dart:convert';

import 'package:clean_arc_tdd_course/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_arc_tdd_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Text test');

  test('it should be a subclass NumberTrivia entity', () async {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON number is an integer',
        () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));
      final result = NumberTriviaModel.fromJson(jsonMap);
      identical(result, tNumberTriviaModel);
    });

    test('should return a valid model when the JSON number is a double',
        () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia_double.json'));
      final result = NumberTriviaModel.fromJson(jsonMap);
      identical(result, tNumberTriviaModel);
    });
  });

  group('toJSON', () {
    test('should return JSON map containing the proper data', () async {
      final result = tNumberTriviaModel.toJson();
      final expectedJsonMap = {
        'text': 'Text test',
        'number': 1,
      };
      expect(result, expectedJsonMap);
    });
  });
}
