
class OrphanageBasketEntity {
  final int basketProductId;
  final String productName;
  final int count;
  final int price;
  final String orphanageName;

  OrphanageBasketEntity({
    required this.basketProductId,
    required this.productName,
    required this.count,
    required this.price,
    required this.orphanageName,
  });

  OrphanageBasketEntity.fromJson(Map<String, dynamic> json)
      : basketProductId = json["basket_product_id"],
        productName = json["product_name"],
        count = json["count"],
        price = json["price"],
        orphanageName = json["orphanage_name"];
}
