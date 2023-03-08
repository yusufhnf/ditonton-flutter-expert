import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv.dart';
import 'package:core/domain/usecases/tv/search_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late SearchTvUseCase usecase;
  late MockTvRepository mockTvRepository;

  setUp(() {
    mockTvRepository = MockTvRepository();
    usecase = SearchTvUseCase(mockTvRepository);
  });

  final tTv = <Tv>[];
  const tQuery = 'Spiderman';

  test('should get list of tvs from the repository', () async {
    // arrange
    when(mockTvRepository.searchTv(tQuery)).thenAnswer((_) async => Right(tTv));
    // act
    final result = await usecase.execute(tQuery);
    // assert
    expect(result, Right(tTv));
  });
}
