part of 'get_feed_cubit.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState.initial() = _Initial;
  const factory FeedState.loading() = _Loading;
  const factory FeedState.success({
    @Default([]) List<FeedModel> posts,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasMoreItems,
  }) = _Success;
  const factory FeedState.error() = _Error;
  const factory FeedState.validationError(ValidationError message) =
      _ValidationError;
  const factory FeedState.noInternet(NoInternetError message) = _NoInternet;
}
