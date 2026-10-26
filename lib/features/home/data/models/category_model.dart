import 'package:flutter/material.dart';

/// Data model representing a product category.
class CategoryModel {
  final String id;
  final String name;
  final IconData icon;
  final Color? iconColor;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    this.iconColor,
  });

  CategoryModel copyWith({
    String? id,
    String? name,
    IconData? icon,
    Color? iconColor,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
