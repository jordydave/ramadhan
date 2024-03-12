
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramadhan_app/presentation/page/detail_surat/arguments/detail_surat_argument.dart';
import 'package:ramadhan_app/presentation/page/detail_surat/detail_surat_worker.dart';
import 'package:ramadhan_app/presentation/page/home/bloc/home_extender.dart';
import 'package:ramadhan_app/ui_kit/color/colors.dart';
import 'package:ramadhan_app/ui_kit/font_style/font_styles.dart';
import 'package:ramadhan_app/ui_kit/get_state/get_state.dart';
import 'package:ramadhan_app/ui_kit/get_state/get_state_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

part 'home_page.dart';
part 'component/surah.dart';
part 'component/bookmark.dart';


mixin _Worker {
  final bloc = Get.find<HomeBloc>();

  List<Worker> get workers {
    return [];
  }
}