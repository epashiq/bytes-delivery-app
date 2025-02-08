// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

@freezed
class CategoryModel with _$CategoryModel {
    const factory CategoryModel({
        @JsonKey(name: "success")
        required bool success,
        @JsonKey(name: "data")
        required Data data,
        @JsonKey(name: "msg")
        required String msg,
    }) = _CategoryModel;

    factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        @JsonKey(name: "title")
        required String title,
        @JsonKey(name: "status")
        required String status,
        @JsonKey(name: "products")
        required List<Product> products,
        @JsonKey(name: "pagination")
        required Pagination pagination,
        @JsonKey(name: "categories")
        required List<Category> categories,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Category with _$Category {
    const factory Category({
        @JsonKey(name: "_id")
        required String id,
        @JsonKey(name: "title")
        required String title,
        @JsonKey(name: "image")
        required String image,
        @JsonKey(name: "isSelected")
        required bool isSelected,
    }) = _Category;

    factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}

@freezed
class Pagination with _$Pagination {
    const factory Pagination({
        @JsonKey(name: "currentPage")
        required int currentPage,
        @JsonKey(name: "totalPages")
        required int totalPages,
        @JsonKey(name: "totalItems")
        required int totalItems,
        @JsonKey(name: "itemsPerPage")
        required int itemsPerPage,
    }) = _Pagination;

    factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}

@freezed
class Product with _$Product {
    const factory Product({
        @JsonKey(name: "_id")
        required String id,
        @JsonKey(name: "price")
        required int price,
        @JsonKey(name: "discountPrice")
        required int discountPrice,
        @JsonKey(name: "title")
        required String title,
        @JsonKey(name: "quantity")
        required int quantity,
        @JsonKey(name: "maxQuantity")
        required int maxQuantity,
        @JsonKey(name: "image")
        required List<Image> image,
        @JsonKey(name: "status")
        required bool status,
        @JsonKey(name: "statusText")
        required String statusText,
        @JsonKey(name: "discounts")
        required List<dynamic> discounts,
        @JsonKey(name: "type")
        required String type,
        @JsonKey(name: "isCustomisable")
        bool? isCustomisable,
        @JsonKey(name: "choice")
        List<Choice>? choice,
    }) = _Product;

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@freezed
class Choice with _$Choice {
    const factory Choice({
        @JsonKey(name: "id")
        required String id,
        @JsonKey(name: "type")
        required String type,
        @JsonKey(name: "title")
        required String title,
        @JsonKey(name: "des")
        required String des,
        @JsonKey(name: "isBasePrice")
        required bool isBasePrice,
        @JsonKey(name: "list")
        required List<ListElement> list,
    }) = _Choice;

    factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
}

@freezed
class ListElement with _$ListElement {
    const factory ListElement({
        @JsonKey(name: "id")
        required String id,
        @JsonKey(name: "title")
        required String title,
        @JsonKey(name: "des")
        required String des,
        @JsonKey(name: "isActive")
        required bool isActive,
        @JsonKey(name: "price")
        required int price,
        @JsonKey(name: "discount")
        required int discount,
        @JsonKey(name: "isSelected")
        required bool isSelected,
    }) = _ListElement;

    factory ListElement.fromJson(Map<String, dynamic> json) => _$ListElementFromJson(json);
}

@freezed
class Image with _$Image {
    const factory Image({
        @JsonKey(name: "url")
        required String url,
    }) = _Image;

    factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
