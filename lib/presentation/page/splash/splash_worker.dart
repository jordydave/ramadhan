import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramadhan_app/presentation/page/splash/bloc/splash_extender.dart';
import 'package:ramadhan_app/ui_kit/get_state/get_state.dart';
import 'package:ramadhan_app/ui_kit/get_state/get_state_builder.dart';
part 'splash_page.dart';

mixin _Worker {
  final bloc = Get.find<SplashBloc>();

  List<Worker> get workers {
    return [];
  }
}