import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/movie_detail.dart';
import 'package:core/domain/repositories/movie_repository.dart';
import 'package:core/utils/failure.dart';

class GetMovieDetailUseCase {
  final MovieRepository repository;

  GetMovieDetailUseCase(this.repository);

  Future<Either<Failure, MovieDetail>> execute(int id) {
    return repository.getMovieDetail(id);
  }
}
