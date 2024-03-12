import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramadhan_app/core/case/case.dart';
import 'package:ramadhan_app/core/util/util.dart';
import 'package:ramadhan_app/domain/entity/surat/detail_surat.dart';
import 'package:ramadhan_app/presentation/page/detail_surat/bloc/detail_surat_extender.dart';
import 'package:ramadhan_app/ui_kit/color/colors.dart';
import 'package:ramadhan_app/ui_kit/font_style/font_styles.dart';
import 'package:ramadhan_app/ui_kit/get_state/get_state.dart';
import 'package:ramadhan_app/ui_kit/get_state/get_state_builder.dart';
import 'package:ramadhan_app/ui_kit/widgets/shared/animated.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

part 'detail_surat_page.dart';
part 'component/header.dart';
part 'component/body_surat.dart';

mixin _Worker {
  final bloc = Get.find<DetailSuratBloc>();

  List<Worker> get workers {
    return [
      Util.listen<DetailSurat>(
        listener: bloc.detailSuratCase,
        callback: (state) {
          if (state is ErrorCase) {
            //
          }
        },
      ),
    ];
  }
}
