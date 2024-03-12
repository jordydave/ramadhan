import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:ramadhan_app/core/case/case.dart';
import 'package:ramadhan_app/domain/entity/surat/detail_surat.dart';
import 'package:ramadhan_app/domain/usecase/detail_surat/detail_surat_usecase.dart';
import 'package:ramadhan_app/presentation/page/detail_surat/arguments/detail_surat_argument.dart';

part 'detail_surat_bloc.dart';

mixin _Extender {
  final detailSuratCase = Case<DetailSurat>().obs;
  final player = AudioPlayer();
  final playerAyat = AudioPlayer();
  final playerState = PlayerState.stopped.obs;
  final selectedSinger = Rx<String?>(null);
  final currentPlayingAyatIndex = Rx<int?>(null);
  var singers = <String>[].obs;
  var playerAyatState = <PlayerState>[].obs;
}
