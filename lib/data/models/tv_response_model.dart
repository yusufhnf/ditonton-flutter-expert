import 'package:ditonton/data/models/tv_model.dart';
import 'package:equatable/equatable.dart';

class TvResponseModel extends Equatable {
  final List<TvModel> tvList;

  TvResponseModel({required this.tvList});

  factory TvResponseModel.fromJson(Map<String, dynamic> json) =>
      TvResponseModel(
        tvList: List<TvModel>.from((json["results"] as List)
            .map((x) => TvModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(tvList.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [tvList];
}
