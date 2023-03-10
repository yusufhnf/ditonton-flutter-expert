import 'dart:convert';

import 'package:core/data/models/tv_model.dart';
import 'package:core/data/models/tv_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  const tTvModel = TvModel(
    backdropPath: "/path.jpg",
    genreIds: [1, 2, 3, 4],
    id: 1,
    overview: "Overview",
    popularity: 1.0,
    posterPath: "/path.jpg",
    name: "Name",
    voteAverage: 1.0,
    voteCount: 1,
    originalName: '',
    originalLanguage: 'en',
    originCountry: ["US"],
    firstAirDate: '2002-02-02',
  );
  const tTvResponseModel = TvResponseModel(tvList: <TvModel>[tTvModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/tv_nowplaying.json'));
      // act
      final result = TvResponseModel.fromJson(jsonMap);
      // assert
      expect(result, tTvResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tTvResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": "/path.jpg",
            "first_air_date": '2002-02-02',
            "genre_ids": [1, 2, 3, 4],
            "id": 1,
            "overview": "Overview",
            "popularity": 1.0,
            "poster_path": "/path.jpg",
            "name": "Name",
            "vote_average": 1.0,
            "vote_count": 1,
            "original_name": '',
            "original_language": 'en',
            "origin_country": ["US"],
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
