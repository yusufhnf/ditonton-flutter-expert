import 'package:core/data/models/tv_model.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tTvModel = TvModel(
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    voteAverage: 1,
    voteCount: 1,
    firstAirDate: 'firstAirDate',
    name: 'name',
    originCountry: ["EN", "US"],
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
  );

  final tTv = Tv(
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    id: 1,
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    voteAverage: 1,
    voteCount: 1,
    firstAirDate: 'firstAirDate',
    name: 'name',
    originCountry: const ["EN", "US"],
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
  );

  test('should be a subclass of Tv entity', () async {
    final result = tTvModel.toEntity();
    expect(result, tTv);
  });
}
