import 'package:ditonton/common/utils.dart';
import 'package:ditonton/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/tv/tv_watchlist/tv_watchlist_bloc.dart';

class WatchlistTvPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-tv';

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
        title: Text('Watchlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TvWatchlistBloc, TvWatchlistState>(
          builder: (context, state) {
            if (state is TvWatchlistEmpty) {
              return Center(child: Text('Data empty'));
            } else if (state is TvWatchlistLoading) {
              return Center(
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

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
