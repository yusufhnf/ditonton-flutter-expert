import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tv.dart';

class TopRatedTvPage extends StatefulWidget {
  static const routeName = '/top-rated-tv';

  const TopRatedTvPage({super.key});

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
        title: const Text(StringConstant.topRatedTv),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvTopRatedBloc, TvTopRatedState>(
          builder: (context, state) {
            if (state is TvTopRatedEmpty) {
              return const Center(child: Text(StringConstant.dataEmpty));
            } else if (state is TvTopRatedLoading) {
              return const Center(
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
                key: const Key('error_message'),
                child: Text(state.message),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
