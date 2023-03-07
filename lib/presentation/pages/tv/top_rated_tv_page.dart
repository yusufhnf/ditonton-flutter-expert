import 'package:ditonton/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/tv/tv_top_rated/tv_top_rated_bloc.dart';

class TopRatedTvPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-tv';

  @override
  _TopRatedTvPageState createState() => _TopRatedTvPageState();
}

class _TopRatedTvPageState extends State<TopRatedTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        BlocProvider.of<TvTopRatedBloc>(context, listen: false)
            .add(OnGetTopRated()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rated Tv'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvTopRatedBloc, TvTopRatedState>(
          builder: (context, state) {
            if (state is TvTopRatedEmpty) {
              return Center(child: Text('Data empty'));
            } else if (state is TvTopRatedLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TvTopRatedSuccess) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = state.tvResult[index];
                  return TvCard(tv);
                },
                itemCount: state.tvResult.length,
              );
            } else if (state is TvTopRatedError) {
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
