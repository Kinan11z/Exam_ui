// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:game/model/product.dart';

class Products {
  Product product;
  int total;
  int skip;
  int limit;
  Products({
    required this.product,
    required this.total,
    required this.skip,
    required this.limit,
  });

  Products copyWith({
    Product? product,
    int? total,
    int? skip,
    int? limit,
  }) {
    return Products(
      product: product ?? this.product,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      product: Product.fromMap(map['product'] as Map<String, dynamic>),
      total: map['total'] as int,
      skip: map['skip'] as int,
      limit: map['limit'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Products(product: $product, total: $total, skip: $skip, limit: $limit)';
  }

  @override
  bool operator ==(covariant Products other) {
    if (identical(this, other)) return true;

    return other.product == product &&
        other.total == total &&
        other.skip == skip &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    return product.hashCode ^ total.hashCode ^ skip.hashCode ^ limit.hashCode;
  }
}
