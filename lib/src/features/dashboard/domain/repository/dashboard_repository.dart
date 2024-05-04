import 'package:injectable/injectable.dart';

import '../../../../core/api/api.dart';
import '../../../../core/core.dart';
import '../../dashboard.dart';

abstract class FeedRemoteSource {
  EitherResponse<ApiResponse<List<FeedModel>>> getFeed(PaginationParam paginationParam);
}

@LazySingleton(as: FeedRemoteSource)
class FeedRemoteSourceImpl extends BaseRemoteSource implements FeedRemoteSource {
  FeedRemoteSourceImpl(super._dio, super._networkInfo);

  @override
  EitherResponse<ApiResponse<List<FeedModel>>> getFeed(PaginationParam paginationParam) async {
    final response = await networkRequest(request: (dio) async {
      final response = await dio.get<Map<String, dynamic>>(
        ApiEndpoints.baseUrl + ApiEndpoints.getFeedPost,
        queryParameters: paginationParam.toMap(),
      );
      return ApiResponse(
        success: response.data?['success'] as bool,
        data: List<dynamic>.from(response.data?['data'] as List<dynamic>).map((e) => FeedModel.fromJson(e as Map<String, dynamic>)).toList(),
        message: response.data?['message'] as String,
        pagination: PaginationModel.fromJson(
          response.data?['pagination'] as Map<String, dynamic>,
        ),
      );
    });
    return response;
  }
}
