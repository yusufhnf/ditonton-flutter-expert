import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:core/domain/entities/tv_detail.dart';
import 'package:core/domain/repositories/tv_repository.dart';

class RemoveWatchlistTvUseCase {
  final TvRepository repository;

  RemoveWatchlistTvUseCase(this.repository);

  Future<Either<Failure, String>> execute(TvDetail tv) {
    return repository.removeWatchlist(tv);
  }
}
