import 'package:chrip_aid/common/dio/dio.dart';
import 'package:chrip_aid/post/model/entity/get_posts_entity.dart';
import 'package:chrip_aid/post/model/repository/orphanage_post_repository.stub.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

part 'orphanage_post_repository.g.dart';

final orphanagePostRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  //return OrphanagePostRepository(dio);
  return OrphanagePostRepositoryStub();
});

@RestApi()
abstract class OrphanagePostRepository {
  factory OrphanagePostRepository(Dio dio, {String? baseUrl}) =
      _OrphanagePostRepository;

  @GET('/posts')
  @Headers({'accessToken': 'true'})
  Future<List<GetPostsEntity>> getOrphanagePosts();
}
