import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/repositories/tv_repository.dart';

class SearchTvUseCase {
  final TvRepository repository;

  SearchTvUseCase(this.repository);

  Future<Either<Failure, List<Tv>>> execute(String query) {
    return repository.searchTv(query);
  }
}
