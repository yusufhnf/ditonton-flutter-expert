import 'package:core/core.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([SearchMoviesUseCase, SearchTvUseCase],
    customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
void main() {}
