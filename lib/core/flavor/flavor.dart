import 'package:flutter/material.dart';

class Flavor {
  final String? name;
  final Color themeColor;
  final Map<String, dynamic> variables;

  Flavor._internal(
    this.name,
    this.themeColor,
    this.variables,
  );

  static Flavor? _instance;

  static Flavor get instance {
    _instance ??= Flavor();

    return _instance!;
  }

  static dynamic map(String key) {
    return instance.variables[key];
  }

  factory Flavor({
    String? name,
    Color color = Colors.white,
    Map<String, dynamic> variables = const {},
  }) {
    _instance = Flavor._internal(
      name,
      color,
      variables,
    );
    return _instance!;
  }
}
