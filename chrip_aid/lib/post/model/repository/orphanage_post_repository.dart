import 'package:chrip_aid/common/dio/dio.dart';
import 'package:chrip_aid/post/model/entity/get_posts_entity.dart';
import 'package:chrip_aid/post/model/entity/tag_entity.dart';
import 'package:chrip_aid/post/model/entity/write_post_request_dto.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

part 'orphanage_post_repository.g.dart';

final orphanagePostRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return OrphanagePostRepository(dio);
  // return OrphanagePostRepositoryStub();
});

@RestApi()
abstract class OrphanagePostRepository {
  factory OrphanagePostRepository(Dio dio, {String? baseUrl}) =
      _OrphanagePostRepository;

  @GET('/posts')
  @Headers({'accessToken': 'true'})
  Future<List<GetPostsEntity>> getOrphanagePosts();

  @POST('/posts')
  @Headers({'accessToken': 'true'})
  Future writePost(@Body() WritePostRequestDTO dto);

  @GET('/posts/tags')
  @Headers({'accessToken': 'true'})
  Future<List<TagEntity>> getTags();
}
