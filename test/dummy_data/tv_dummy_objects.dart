import 'package:ditonton/data/models/tv_table.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/season.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';

final testTv = Tv(
    backdropPath: "/4g5gK5eGWZg8swIZl6eX2AoJp8S.jpg",
    genreIds: [18],
    id: 11250,
    name: "Pasión de gavilanes",
    originCountry: ["CO"],
    originalLanguage: "es",
    originalName: "Pasión de gavilanes",
    overview:
        "The Reyes-Elizondo's idyllic lives are shattered by a murder charge against Eric and León.",
    popularity: 3645.173,
    posterPath: "/lWlsZIsrGVWHtBeoOeLxIKDd9uy.jpg",
    voteAverage: 7.6,
    voteCount: 1765,
    firstAirDate: '2002-05-01');

final testTvList = [testTv];

final testTvDetail = TvDetail(
  genres: [Genre(id: 1, name: 'Action')],
  seasons: [
    Season(
        episodeCount: 5,
        id: 1,
        name: "name",
        overview: "overview",
        posterPath: "posterPath",
        seasonNumber: 10)
  ],
  adult: false,
  backdropPath: 'backdropPath',
  homepage: '',
  id: 1,
  inProduction: false,
  name: 'name',
  numberOfEpisodes: 0,
  numberOfSeasons: 0,
  originalLanguage: '',
  originalName: '',
  overview: 'overview',
  popularity: 0.0,
  posterPath: 'posterPath',
  status: "",
  tagline: '',
  type: '',
  voteAverage: 0,
  voteCount: 0,
);

final testWatchlistTv = Tv.watchlist(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvTable = TvTable(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'name': 'name',
};
