import 'package:chrip_aid/common/value_state/state/value_state.dart';
import 'package:chrip_aid/orphanage/model/entity/donate_entity.dart';
import 'package:chrip_aid/orphanage/model/entity/orphanage_basket_entity.dart';
import 'package:chrip_aid/orphanage/model/entity/orphanage_detail_entity.dart';
import 'package:chrip_aid/orphanage/model/entity/orphanage_entity.dart';

class OrphanageListState extends ValueStateNotifier<List<OrphanageEntity>> {}

class OrphanageDetailState extends ValueStateNotifier<OrphanageDetailEntity> {}

class OrphanageBasketState extends ValueStateNotifier<List<OrphanageBasketEntity>> {}

class OrphanageDonateState extends ValueStateNotifier<List<DonateEntity>> {}