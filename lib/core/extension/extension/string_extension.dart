part of '../extension.dart';

extension StringExtension on String? {
  String get uri {
    final str = this ?? '';
    return Consts.base.dev + str;
  }
}
