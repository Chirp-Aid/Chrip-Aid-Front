// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_posts_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostsEntity _$GetPostsEntityFromJson(Map<String, dynamic> json) =>
    GetPostsEntity(
      reviewId: json['review_id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      photo: (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      date: json['date'] as String,
      name: json['name'] as String,
      orphanageName: json['orphanage_name'] as String,
      productNames: (json['product_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GetPostsEntityToJson(GetPostsEntity instance) =>
    <String, dynamic>{
      'review_id': instance.reviewId,
      'title': instance.title,
      'content': instance.content,
      'photos': instance.photo,
      'date': instance.date,
      'name': instance.name,
      'orphanage_name': instance.orphanageName,
      'product_names': instance.productNames,
    };
