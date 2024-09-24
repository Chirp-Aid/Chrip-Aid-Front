import 'package:chrip_aid/common/dio/dio.dart';
import 'package:chrip_aid/reservation/model/entity/orphanage_visit_entity.dart';
import 'package:chrip_aid/reservation/model/entity/reservation_answer_request_dto.dart';
import 'package:chrip_aid/reservation/model/entity/reservation_entity.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';
part 'reservation_repository.g.dart';

final reservationRepositoryProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  // return ReservationRepositoryStub();
  return ReservationRepository(dio);
});

@RestApi()
abstract class ReservationRepository {
  factory ReservationRepository(Dio dio, {String? baseUrl}) =
      _ReservationRepository;

  @GET('/reservations')
  @Headers({'accessToken' : 'true'})
  Future<List<ReservationEntity>> getOrphanageReservation(@Query('account') String account);

  @GET('/reservations')
  @Headers({'accessToken' : 'true'})
  Future<List<OrphanageReservationEntity>> getOrphanageVisitReservation(@Query('account') String account);

  @POST('/reservations')
  @Headers({'accessToken' : 'true'})
  Future post(@Body() OrphanageVisitEntity entity);

  @PATCH('/reservations')
  @Headers({'accessToken' : 'true'})
  Future answer(@Body() ReservationAnswerRequestDto dto);
}
