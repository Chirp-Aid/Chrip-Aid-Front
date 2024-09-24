import 'package:chrip_aid/common/dio/dio.dart';
import 'package:chrip_aid/orphanage/model/entity/orphanage_entity.dart';
import 'package:chrip_aid/orphanage/model/entity/orphanage_detail_entity.dart';
import 'package:chrip_aid/orphanage/model/repository/orphanage_repository.stub.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';
part 'orphanage_repository.g.dart';

final orphanageRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return OrphanageRepository(dio);
  // return OrphanageRepositoryStub();
});

@RestApi()
abstract class OrphanageRepository {
  factory OrphanageRepository(Dio dio, {String? baseUrl}) =
      _OrphanageRepository;

  @GET('/orphanages/{id}')
  @Headers({'accessToken': 'true'})
  Future<OrphanageDetailEntity> getOrphanageDetail(@Path("id") int id);

  @GET('/orphanages')
  @Headers({'accessToken': 'true'})
  Future<List<OrphanageEntity>> getOrphanageList();
}
