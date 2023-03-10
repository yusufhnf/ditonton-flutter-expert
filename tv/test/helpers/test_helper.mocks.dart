// Mocks generated by Mockito 5.3.2 from annotations
// in tv/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:convert' as _i31;
import 'dart:typed_data' as _i32;

import 'package:core/data/datasources/db/tv_database_helper.dart' as _i15;
import 'package:core/data/datasources/tv_local_data_source.dart' as _i13;
import 'package:core/data/datasources/tv_remote_data_source.dart' as _i11;
import 'package:core/data/models/tv_detail_model.dart' as _i3;
import 'package:core/data/models/tv_model.dart' as _i12;
import 'package:core/data/models/tv_table.dart' as _i14;
import 'package:core/domain/entities/movie_detail.dart' as _i19;
import 'package:core/domain/entities/tv.dart' as _i9;
import 'package:core/domain/entities/tv_detail.dart' as _i10;
import 'package:core/domain/repositories/movie_repository.dart' as _i4;
import 'package:core/domain/repositories/tv_repository.dart' as _i5;
import 'package:core/domain/usecases/movie/get_watchlist_status.dart' as _i17;
import 'package:core/domain/usecases/movie/remove_watchlist.dart' as _i18;
import 'package:core/domain/usecases/movie/save_watchlist.dart' as _i20;
import 'package:core/domain/usecases/tv/get_now_playing_tv.dart' as _i21;
import 'package:core/domain/usecases/tv/get_popular_tv.dart' as _i22;
import 'package:core/domain/usecases/tv/get_top_rated_tv.dart' as _i23;
import 'package:core/domain/usecases/tv/get_tv_detail.dart' as _i24;
import 'package:core/domain/usecases/tv/get_tv_recommendations.dart' as _i25;
import 'package:core/domain/usecases/tv/get_watchlist_tv.dart' as _i26;
import 'package:core/domain/usecases/tv/get_watchlist_tv_status.dart' as _i27;
import 'package:core/domain/usecases/tv/remove_watchlist_tv.dart' as _i28;
import 'package:core/domain/usecases/tv/save_watchlist_tv.dart' as _i29;
import 'package:core/domain/usecases/tv/search_tv.dart' as _i30;
import 'package:core/utils/failure.dart' as _i8;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i16;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvDetailModel_1 extends _i1.SmartFake implements _i3.TvDetailModel {
  _FakeTvDetailModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieRepository_2 extends _i1.SmartFake
    implements _i4.MovieRepository {
  _FakeMovieRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvRepository_3 extends _i1.SmartFake implements _i5.TvRepository {
  _FakeTvRepository_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_4 extends _i1.SmartFake implements _i6.Response {
  _FakeResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_5 extends _i1.SmartFake
    implements _i6.StreamedResponse {
  _FakeStreamedResponse_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TvRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRepository extends _i1.Mock implements _i5.TvRepository {
  MockTvRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> getNowPlayingTv() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingTv,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #getNowPlayingTv,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> getPopularTv() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTv,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #getPopularTv,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> getTopRatedTv() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTv,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #getTopRatedTv,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, _i10.TvDetail>> getTvDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvDetail,
          [id],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, _i10.TvDetail>>.value(
            _FakeEither_0<_i8.Failure, _i10.TvDetail>(
          this,
          Invocation.method(
            #getTvDetail,
            [id],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, _i10.TvDetail>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> getTvRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvRecommendations,
          [id],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #getTvRecommendations,
            [id],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> searchTv(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTv,
          [query],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #searchTv,
            [query],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> saveWatchlist(
          _i10.TvDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlist,
          [movie],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, String>>.value(
            _FakeEither_0<_i8.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlist,
            [movie],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> removeWatchlist(
          _i10.TvDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [movie],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, String>>.value(
            _FakeEither_0<_i8.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [movie],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, String>>);
  @override
  _i7.Future<bool> isAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> getWatchlistTv() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTv,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #getWatchlistTv,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
}

/// A class which mocks [TvRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvRemoteDataSource extends _i1.Mock
    implements _i11.TvRemoteDataSource {
  MockTvRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i12.TvModel>> getNowPlayingTv() => (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingTv,
          [],
        ),
        returnValue: _i7.Future<List<_i12.TvModel>>.value(<_i12.TvModel>[]),
      ) as _i7.Future<List<_i12.TvModel>>);
  @override
  _i7.Future<List<_i12.TvModel>> getPopularTv() => (super.noSuchMethod(
        Invocation.method(
          #getPopularTv,
          [],
        ),
        returnValue: _i7.Future<List<_i12.TvModel>>.value(<_i12.TvModel>[]),
      ) as _i7.Future<List<_i12.TvModel>>);
  @override
  _i7.Future<List<_i12.TvModel>> getTopRatedTv() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTv,
          [],
        ),
        returnValue: _i7.Future<List<_i12.TvModel>>.value(<_i12.TvModel>[]),
      ) as _i7.Future<List<_i12.TvModel>>);
  @override
  _i7.Future<_i3.TvDetailModel> getTvDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvDetail,
          [id],
        ),
        returnValue: _i7.Future<_i3.TvDetailModel>.value(_FakeTvDetailModel_1(
          this,
          Invocation.method(
            #getTvDetail,
            [id],
          ),
        )),
      ) as _i7.Future<_i3.TvDetailModel>);
  @override
  _i7.Future<List<_i12.TvModel>> getTvRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvRecommendations,
          [id],
        ),
        returnValue: _i7.Future<List<_i12.TvModel>>.value(<_i12.TvModel>[]),
      ) as _i7.Future<List<_i12.TvModel>>);
  @override
  _i7.Future<List<_i12.TvModel>> searchTv(String? query) => (super.noSuchMethod(
        Invocation.method(
          #searchTv,
          [query],
        ),
        returnValue: _i7.Future<List<_i12.TvModel>>.value(<_i12.TvModel>[]),
      ) as _i7.Future<List<_i12.TvModel>>);
}

/// A class which mocks [TvLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvLocalDataSource extends _i1.Mock implements _i13.TvLocalDataSource {
  MockTvLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> insertWatchlist(_i14.TvTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [tv],
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<String> removeWatchlist(_i14.TvTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [tv],
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<_i14.TvTable?> getTvById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvById,
          [id],
        ),
        returnValue: _i7.Future<_i14.TvTable?>.value(),
      ) as _i7.Future<_i14.TvTable?>);
  @override
  _i7.Future<List<_i14.TvTable>> getWatchlistTv() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTv,
          [],
        ),
        returnValue: _i7.Future<List<_i14.TvTable>>.value(<_i14.TvTable>[]),
      ) as _i7.Future<List<_i14.TvTable>>);
}

/// A class which mocks [TvDatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvDatabaseHelper extends _i1.Mock implements _i15.TvDatabaseHelper {
  MockTvDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i16.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i7.Future<_i16.Database?>.value(),
      ) as _i7.Future<_i16.Database?>);
  @override
  _i7.Future<int> insertWatchlist(_i14.TvTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [tv],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);
  @override
  _i7.Future<int> removeWatchlist(_i14.TvTable? tv) => (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [tv],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);
  @override
  _i7.Future<Map<String, dynamic>?> getTvById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvById,
          [id],
        ),
        returnValue: _i7.Future<Map<String, dynamic>?>.value(),
      ) as _i7.Future<Map<String, dynamic>?>);
  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlistTv() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTv,
          [],
        ),
        returnValue: _i7.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i7.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [GetWatchListStatusUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchListStatusUseCase extends _i1.Mock
    implements _i17.GetWatchListStatusUseCase {
  MockGetWatchListStatusUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.MovieRepository);
  @override
  _i7.Future<bool> execute(int? id) => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
}

/// A class which mocks [RemoveWatchlistUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveWatchlistUseCase extends _i1.Mock
    implements _i18.RemoveWatchlistUseCase {
  MockRemoveWatchlistUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.MovieRepository);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> execute(
          _i19.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [movie],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, String>>.value(
            _FakeEither_0<_i8.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [movie],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, String>>);
}

/// A class which mocks [SaveWatchlistUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveWatchlistUseCase extends _i1.Mock
    implements _i20.SaveWatchlistUseCase {
  MockSaveWatchlistUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.MovieRepository);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> execute(
          _i19.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [movie],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, String>>.value(
            _FakeEither_0<_i8.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [movie],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, String>>);
}

/// A class which mocks [GetNowPlayingTvUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetNowPlayingTvUseCase extends _i1.Mock
    implements _i21.GetNowPlayingTvUseCase {
  MockGetNowPlayingTvUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.TvRepository);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
}

/// A class which mocks [GetPopularTvUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPopularTvUseCase extends _i1.Mock
    implements _i22.GetPopularTvUseCase {
  MockGetPopularTvUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.TvRepository);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
}

/// A class which mocks [GetTopRatedTvUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTopRatedTvUseCase extends _i1.Mock
    implements _i23.GetTopRatedTvUseCase {
  MockGetTopRatedTvUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.TvRepository);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
}

/// A class which mocks [GetTvDetailUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvDetailUseCase extends _i1.Mock
    implements _i24.GetTvDetailUseCase {
  MockGetTvDetailUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.TvRepository);
  @override
  _i7.Future<_i2.Either<_i8.Failure, _i10.TvDetail>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, _i10.TvDetail>>.value(
            _FakeEither_0<_i8.Failure, _i10.TvDetail>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, _i10.TvDetail>>);
}

/// A class which mocks [GetTvRecommendationsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTvRecommendationsUseCase extends _i1.Mock
    implements _i25.GetTvRecommendationsUseCase {
  MockGetTvRecommendationsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.TvRepository);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> execute(dynamic id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
}

/// A class which mocks [GetWatchlistTvUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlistTvUseCase extends _i1.Mock
    implements _i26.GetWatchlistTvUseCase {
  MockGetWatchlistTvUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
}

/// A class which mocks [GetWatchListTvStatusUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchListTvStatusUseCase extends _i1.Mock
    implements _i27.GetWatchListTvStatusUseCase {
  MockGetWatchListTvStatusUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.TvRepository);
  @override
  _i7.Future<bool> execute(int? id) => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
}

/// A class which mocks [RemoveWatchlistTvUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveWatchlistTvUseCase extends _i1.Mock
    implements _i28.RemoveWatchlistTvUseCase {
  MockRemoveWatchlistTvUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.TvRepository);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> execute(_i10.TvDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [tv],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, String>>.value(
            _FakeEither_0<_i8.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [tv],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, String>>);
}

/// A class which mocks [SaveWatchlistTvUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveWatchlistTvUseCase extends _i1.Mock
    implements _i29.SaveWatchlistTvUseCase {
  MockSaveWatchlistTvUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.TvRepository);
  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> execute(_i10.TvDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [tv],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, String>>.value(
            _FakeEither_0<_i8.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [tv],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, String>>);
}

/// A class which mocks [SearchTvUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchTvUseCase extends _i1.Mock implements _i30.SearchTvUseCase {
  MockSearchTvUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.TvRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTvRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.TvRepository);
  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>> execute(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [query],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Tv>>(
          this,
          Invocation.method(
            #execute,
            [query],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Tv>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i6.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i6.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i7.Future<_i6.Response>);
  @override
  _i7.Future<_i6.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i7.Future<_i6.Response>);
  @override
  _i7.Future<_i6.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i31.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i6.Response>);
  @override
  _i7.Future<_i6.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i31.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i6.Response>);
  @override
  _i7.Future<_i6.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i31.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i6.Response>);
  @override
  _i7.Future<_i6.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i31.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i6.Response>);
  @override
  _i7.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<String>.value(''),
      ) as _i7.Future<String>);
  @override
  _i7.Future<_i32.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i32.Uint8List>.value(_i32.Uint8List(0)),
      ) as _i7.Future<_i32.Uint8List>);
  @override
  _i7.Future<_i6.StreamedResponse> send(_i6.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i7.Future<_i6.StreamedResponse>.value(_FakeStreamedResponse_5(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i7.Future<_i6.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
