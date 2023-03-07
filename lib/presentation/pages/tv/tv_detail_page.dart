import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../common/string_constants.dart';
import '../../bloc/tv/tv_detail/tv_detail_bloc.dart';
import '../../bloc/tv/tv_recommendation/tv_recommendation_bloc.dart';
import '../../bloc/tv/tv_watchlist/tv_watchlist_bloc.dart';

class TvDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail-tv';

  final int id;
  TvDetailPage({required this.id});

  @override
  _TvDetailPageState createState() => _TvDetailPageState();
}

class _TvDetailPageState extends State<TvDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvDetailBloc>().add(OnGetDetail(widget.id));
      context.read<TvRecommendationBloc>().add(OnGetRecommendation(widget.id));
      context.read<TvWatchlistBloc>().add(WatchlistStatus(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    final isListed = context.select<TvWatchlistBloc, bool>((bloc) {
      if (bloc.state is TvWatchlistIsWatchlist) {
        return (bloc.state as TvWatchlistIsWatchlist).isListed;
      }
      return false;
    });
    return Scaffold(
      body: BlocBuilder<TvDetailBloc, TvDetailState>(
        builder: (context, state) {
          if (state is TvDetailEmpty) {
            return Center(child: Text(StringConstant.dataEmpty));
          } else if (state is TvDetailLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TvDetailSuccess) {
            final tv = state.detailResult;
            return SafeArea(
              child: DetailContent(
                tv,
                isListed,
              ),
            );
          } else if (state is TvDetailError) {
            return Text(state.message);
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class DetailContent extends StatefulWidget {
  final TvDetail tv;
  bool isListedWatchlist;

  DetailContent(this.tv, this.isListedWatchlist);

  @override
  State<DetailContent> createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${widget.tv.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.tv.name,
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () => addRemoveWatchlist(),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  widget.isListedWatchlist
                                      ? Icon(Icons.check)
                                      : Icon(Icons.add),
                                  Text(StringConstant.watchlist),
                                ],
                              ),
                            ),
                            Text(
                              _showGenres(widget.tv.genres),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: widget.tv.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${widget.tv.voteAverage}')
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              StringConstant.overview,
                              style: kHeading6,
                            ),
                            Text(
                              widget.tv.overview,
                            ),
                            SizedBox(height: 16),
                            Text(
                              StringConstant.totalEpisode,
                              style: kHeading6,
                            ),
                            Text(
                              "${widget.tv.numberOfEpisodes} ${StringConstant.episode}",
                            ),
                            SizedBox(height: 16),
                            Text(
                              StringConstant.season,
                              style: kHeading6,
                            ),
                            Container(
                              height: 150,
                              child: widget.tv.seasons.isNotEmpty
                                  ? ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final seasonData =
                                            widget.tv.seasons[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  'https://image.tmdb.org/t/p/w500${seasonData.posterPath}',
                                              placeholder: (context, url) =>
                                                  Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                              errorWidget: (context, url,
                                                      error) =>
                                                  Center(
                                                      child: Icon(Icons.error)),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: widget.tv.seasons.length,
                                    )
                                  : Center(
                                      child: Text(StringConstant.noSeason),
                                    ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              StringConstant.recommendation,
                              style: kHeading6,
                            ),
                            BlocBuilder<TvRecommendationBloc,
                                TvRecommendationState>(
                              builder: (context, state) {
                                if (state is TvRecommendationEmpty) {
                                  return Center(
                                      child: Text(StringConstant.dataEmpty));
                                } else if (state is TvRecommendationLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is TvRecommendationError) {
                                  return Text(state.message);
                                } else if (state is TvRecommendationSuccess) {
                                  return Container(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final tv = state.tvResult[index];
                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                TvDetailPage.ROUTE_NAME,
                                                arguments: tv.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://image.tmdb.org/t/p/w500${tv.posterPath}',
                                                placeholder: (context, url) =>
                                                    Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: state.tvResult.length,
                                    ),
                                  );
                                } else {
                                  return SizedBox.shrink();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += genre.name + ', ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  Future addRemoveWatchlist() async {
    if (!widget.isListedWatchlist) {
      context.read<TvWatchlistBloc>().add(AddWatchlist(widget.tv));
    } else {
      context.read<TvWatchlistBloc>().add(RemoveWatchlist(widget.tv));
    }
    final state = BlocProvider.of<TvWatchlistBloc>(context).state;
    String message = "";

    if (state is TvWatchlistIsWatchlist) {
      final isAdded = state.isListed;
      message = isAdded == false
          ? StringConstant.addToWatchlist
          : StringConstant.removeFromWatchlist;
    } else {
      message = !widget.isListedWatchlist
          ? StringConstant.addToWatchlist
          : StringConstant.removeFromWatchlist;
    }
    if (message == StringConstant.addToWatchlist ||
        message == StringConstant.removeFromWatchlist) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(message),
            );
          });
    }
    setState(() {
      widget.isListedWatchlist = !widget.isListedWatchlist;
    });
  }
}
