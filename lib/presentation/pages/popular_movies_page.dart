import 'package:ditonton/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-movie';

  @override
  _PopularMoviesPageState createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        BlocProvider.of<MoviePopularBloc>(context, listen: false)
            .add(OnGetPopular()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<MoviePopularBloc, MoviePopularState>(
          builder: (context, state) {
            if (state is MoviePopularEmpty) {
              return Center(child: Text('Data empty'));
            } else if (state is MoviePopularLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MoviePopularSuccess) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = state.movieResult[index];
                  return MovieCard(movie);
                },
                itemCount: state.movieResult.length,
              );
            } else if (state is MoviePopularError) {
              return Center(
                key: Key('error_message'),
                child: Text(state.message),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
