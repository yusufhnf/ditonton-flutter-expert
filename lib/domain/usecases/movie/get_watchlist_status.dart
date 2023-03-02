import 'package:ditonton/domain/repositories/movie_repository.dart';

class GetWatchListStatusUseCase {
  final MovieRepository repository;

  GetWatchListStatusUseCase(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlist(id);
  }
}
