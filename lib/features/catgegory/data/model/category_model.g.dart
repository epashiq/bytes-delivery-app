// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      success: json['success'] as bool,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'msg': instance.msg,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      title: json['title'] as String,
      status: json['status'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'status': instance.status,
      'products': instance.products,
      'pagination': instance.pagination,
      'categories': instance.categories,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      isSelected: json['isSelected'] as bool,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'isSelected': instance.isSelected,
    };

_$PaginationImpl _$$PaginationImplFromJson(Map<String, dynamic> json) =>
    _$PaginationImpl(
      currentPage: (json['currentPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      itemsPerPage: (json['itemsPerPage'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginationImplToJson(_$PaginationImpl instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
      'itemsPerPage': instance.itemsPerPage,
    };

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['_id'] as String,
      price: (json['price'] as num).toInt(),
      discountPrice: (json['discountPrice'] as num).toInt(),
      title: json['title'] as String,
      quantity: (json['quantity'] as num).toInt(),
      maxQuantity: (json['maxQuantity'] as num).toInt(),
      image: (json['image'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool,
      statusText: json['statusText'] as String,
      discounts: json['discounts'] as List<dynamic>,
      type: json['type'] as String,
      isCustomisable: json['isCustomisable'] as bool?,
      choice: (json['choice'] as List<dynamic>?)
          ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'title': instance.title,
      'quantity': instance.quantity,
      'maxQuantity': instance.maxQuantity,
      'image': instance.image,
      'status': instance.status,
      'statusText': instance.statusText,
      'discounts': instance.discounts,
      'type': instance.type,
      'isCustomisable': instance.isCustomisable,
      'choice': instance.choice,
    };

_$ChoiceImpl _$$ChoiceImplFromJson(Map<String, dynamic> json) => _$ChoiceImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      des: json['des'] as String,
      isBasePrice: json['isBasePrice'] as bool,
      list: (json['list'] as List<dynamic>)
          .map((e) => ListElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChoiceImplToJson(_$ChoiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'des': instance.des,
      'isBasePrice': instance.isBasePrice,
      'list': instance.list,
    };

_$ListElementImpl _$$ListElementImplFromJson(Map<String, dynamic> json) =>
    _$ListElementImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      des: json['des'] as String,
      isActive: json['isActive'] as bool,
      price: (json['price'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
      isSelected: json['isSelected'] as bool,
    );

Map<String, dynamic> _$$ListElementImplToJson(_$ListElementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'des': instance.des,
      'isActive': instance.isActive,
      'price': instance.price,
      'discount': instance.discount,
      'isSelected': instance.isSelected,
    };

_$ImageImpl _$$ImageImplFromJson(Map<String, dynamic> json) => _$ImageImpl(
      url: json['url'] as String,
    );

Map<String, dynamic> _$$ImageImplToJson(_$ImageImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
