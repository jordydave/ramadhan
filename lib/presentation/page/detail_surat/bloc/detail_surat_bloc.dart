part of 'detail_surat_extender.dart';

class DetailSuratBloc extends GetxController with _Extender {
  final DetailSuratUsecase detailSuratUsecase;
  final DetailSuratArgument argument;

  DetailSuratBloc({
    required this.detailSuratUsecase,
    required this.argument,
  }) {
    player.onPlayerStateChanged.listen((state) {
      playerState.value = state;
    });
    playerAyat.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed || state == PlayerState.stopped) {
        currentPlayingAyatIndex.value = null;
      } else if (currentPlayingAyatIndex.value != null) {
        playerAyatState[currentPlayingAyatIndex.value!] = state;
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    getDetailSurat(argument.nomor);
  }

  @override
  void onClose() {
    super.onClose();
    player.dispose();
    playerAyat.dispose();
  }

  void getDetailSurat(int nomor) async {
    detailSuratCase(LoadingCase());
    final response = await detailSuratUsecase.getDetailSurat(nomor);
    response.fold(
      (error) => detailSuratCase(ErrorCase(error)),
      (data) {
        playerAyatState = List<PlayerState>.filled(
          data.data.ayat.length,
          PlayerState.stopped,
        ).obs;
        return detailSuratCase(LoadedCase(data));
      },
    );
  }

  void playAudioFull(String source) async {
    await player.play(UrlSource(source));
  }

  void playAudioAyat(String source, int index) async {
    await playerAyat.play(UrlSource(source));
    playerAyatState[index] = PlayerState.playing;
    currentPlayingAyatIndex.value = index;
  }

  void pauseAudio() async {
    await player.pause();
  }

  void pauseAudioAyat(int index) async {
    await playerAyat.pause();
    playerAyatState[index] = PlayerState.paused;
  }

  void resumeAudio() async {
    await player.resume();
  }

  void resumeAudioAyat(int index) async {
    await playerAyat.resume();
    playerAyatState[index] = PlayerState.playing;
  }

  void stopAudio() async {
    await player.stop();
  }

  void stopAudioAyat(int index) async {
    await playerAyat.stop();
    playerAyatState[index] = PlayerState.stopped;
  }
}
