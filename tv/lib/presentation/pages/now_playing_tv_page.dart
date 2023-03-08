import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tv.dart';

class NowPlayingTvPage extends StatefulWidget {
  static const routeName = '/nowplaying-tv';

  const NowPlayingTvPage({super.key});

  @override
  State<NowPlayingTvPage> createState() => _NowPlayingTvPageState();
}

class _NowPlayingTvPageState extends State<NowPlayingTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        BlocProvider.of<TvNowPlayingBloc>(context, listen: false)
            .add(OnGetNowPlaying()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstant.nowPlayingTv),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvNowPlayingBloc, TvNowPlayingState>(
          builder: (context, state) {
            if (state is TvNowPlayingEmpty) {
              return const Center(child: Text(StringConstant.dataEmpty));
            } else if (state is TvNowPlayingLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TvNowPlayingSuccess) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = state.tvResult[index];
                  return TvCard(tv);
                },
                itemCount: state.tvResult.length,
              );
            } else if (state is TvNowPlayingError) {
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
