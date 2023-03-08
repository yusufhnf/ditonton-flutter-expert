import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tv.dart';

class WatchlistTvPage extends StatefulWidget {
  static const routeName = '/watchlist-tv';

  const WatchlistTvPage({super.key});

  @override
  _WatchlistTvPageState createState() => _WatchlistTvPageState();
}

class _WatchlistTvPageState extends State<WatchlistTvPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<TvWatchlistBloc>().add(OnGetWatchlist()));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    Future.microtask(
        () => context.read<TvWatchlistBloc>().add(OnGetWatchlist()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstant.watchlist),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvWatchlistBloc, TvWatchlistState>(
          builder: (context, state) {
            if (state is TvWatchlistEmpty) {
              return const Center(child: Text(StringConstant.dataEmpty));
            } else if (state is TvWatchlistLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TvWatchlistSuccess) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = state.tvResult[index];
                  return TvCard(tv);
                },
                itemCount: state.tvResult.length,
              );
            } else if (state is TvWatchlistError) {
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

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
