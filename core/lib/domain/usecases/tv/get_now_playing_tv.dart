import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/repositories/tv_repository.dart';
import 'package:core/utils/failure.dart';

class GetNowPlayingTvUseCase {
  final TvRepository repository;

  GetNowPlayingTvUseCase(this.repository);

  Future<Either<Failure, List<Tv>>> execute() {
    return repository.getNowPlayingTv();
  }
}
