import 'package:chrip_aid/common/dio/dio.dart';
import 'package:chrip_aid/orphanage/model/dto/donate_delete_dto.dart';
import 'package:chrip_aid/orphanage/model/dto/donate_request_dto.dart';
import 'package:chrip_aid/orphanage/model/entity/donate_entity.dart';
import 'package:chrip_aid/orphanage/model/entity/update_basket_item_entity.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';
import '../entity/add_basket_item_entity.dart';
import '../entity/orphanage_basket_entity.dart';
import 'orphanage_basket_repository.stub.dart';

part 'orphanage_basket_repository.g.dart';

final orphanageBasketRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return OrphanageBasketRepository(dio);
  // return OrphanageBasketRepositoryStub();
});

@RestApi()
abstract class OrphanageBasketRepository {
  factory OrphanageBasketRepository(Dio dio, {String? baseUrl}) =
      _OrphanageBasketRepository;

  @POST('/donate/basket')
  @Headers({'accessToken': 'true'})
  Future addBasket(@Body() AddBasketItemEntity entity);

  @PATCH('/donate/basket')
  @Headers({'accessToken': 'true'})
  Future updateBasket(@Body() UpdateBasketItemEntity entity);

  @DELETE('/donate/basket')
  @Headers({'accessToken': 'true'})
  Future deleteBasket(@Body() DonateDeleteDto dto);

  @GET('/donate/basket')
  @Headers({'accessToken': 'true'})
  Future<List<OrphanageBasketEntity>> getOrphanageBasket();

  @GET('/donate')
  @Headers({'accessToken': 'true'})
  Future<List<DonateEntity>> getOrphanageDonate(
      @Query('account') String account);

  @POST('/donate')
  @Headers({'accessToken': 'true'})
  Future donate(@Body() DonateRequestDTO dto);
}
