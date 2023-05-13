import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {

  factory Product({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "category") String? category,
    @JsonKey(name: "image") String? image,
    @JsonKey(name: "rating") Rating? rating,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}


@freezed
class Rating with _$Rating {

  factory Rating({
    @JsonKey(name: "rate") double? rate,
    @JsonKey(name: "count") int? count,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}