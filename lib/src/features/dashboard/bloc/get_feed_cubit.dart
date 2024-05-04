import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:oydeeedashboard/src/core/api/api.dart';

import '../dashboard.dart';

part 'get_feed_state.dart';
part 'get_feed_cubit.freezed.dart';

@injectable
class FeedCubit extends Cubit<FeedState> {
  FeedCubit(this._remoteSource) : super(const FeedState.initial());
  final FeedRemoteSource _remoteSource;

  late List<FeedModel> _posts = [];

  bool hasNext = true;

  // pagination params
  late int _page = 1;
  late int _limit = 8;

  void set handleLoadMore(bool enable) => hasNext = enable;

  Future<void> getUserFeed() async {
    emit(const FeedState.loading());
    final response = await _remoteSource.getFeed(PaginationParam(page: _page, limit: _limit));
    emit(
      response.fold(
        (error) => error.when(
          serverError: (message) => const FeedState.error(),
          validationError: FeedState.validationError,
          noInternet: FeedState.noInternet,
        ),
        (response) {
          _page++;
          _posts = response.data;
          return FeedState.success(
            posts: response.data,
            hasMoreItems: response.pagination?.hasNextPage ?? false,
            isLoadingMore: false,
          );
        },
      ),
    );
  }
}
