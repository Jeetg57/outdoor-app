// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      onlineUrl: json['onlineUrl'] as String?,
      additionalUrls: (json['additionalUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      accessibility: (json['accessibility'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      eventCategory: json['eventCategory'] as String?,
      address: json['address'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      keywords: (json['keywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      maxAttendees: json['maxAttendees'] as int?,
      registrationDeadline: json['registrationDeadline'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      location: json['location'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      priceCountry: json['priceCountry'] as String?,
      price: json['price'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      userId: json['userId'] as int?,
      cCount: json['cCount'],
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'onlineUrl': instance.onlineUrl,
      'additionalUrls': instance.additionalUrls,
      'accessibility': instance.accessibility,
      'eventCategory': instance.eventCategory,
      'address': instance.address,
      'images': instance.images,
      'keywords': instance.keywords,
      'maxAttendees': instance.maxAttendees,
      'registrationDeadline': instance.registrationDeadline,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'location': instance.location,
      'lat': instance.lat,
      'lng': instance.lng,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'priceCountry': instance.priceCountry,
      'price': instance.price,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'userId': instance.userId,
      'cCount': instance.cCount,
    };
