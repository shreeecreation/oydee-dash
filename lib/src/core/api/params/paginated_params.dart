import 'package:equatable/equatable.dart';
import 'package:oydeeedashboard/src/features/dashboard/dashboard.dart';

class PaginationParam extends Equatable {
  const PaginationParam({
    this.page = 1,
    this.limit = 10,
    this.userId,
    this.feedPostType,
  });

  final int? page;
  final int? limit;
  final String? userId;
  final FeedType? feedPostType;

  @override
  List<Object?> get props => [page, limit];
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {
      'page': page,
      'limit': limit,
    };

    if (userId != null) {
      map['userId'] = userId;
    }
    if (feedPostType != null) {
      map['type'] = feedPostType!.name;
    }

    return map;
  }
}
