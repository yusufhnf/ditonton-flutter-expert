import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetWatchListTvStatusUseCase {
  final TvRepository repository;

  GetWatchListTvStatusUseCase(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlist(id);
  }
}
