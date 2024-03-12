part of '../detail_surat_worker.dart';

class _Header extends StatelessWidget {
  final DetailSuratBloc bloc;
  const _Header({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var state = bloc.detailSuratCase.value;
      var audioFull = state.data?.data.audioFull;

      List<String> urls = [
        audioFull?.first ?? '',
        audioFull?.second ?? '',
        audioFull?.third ?? '',
        audioFull?.fourth ?? '',
        audioFull?.fifth ?? '',
      ];
      return Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.data?.data.nama ?? '',
                    style: AppStyles.primaryText.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      if (bloc.playerState.value == PlayerState.playing)
                        IconButton(
                          onPressed: () {
                            bloc.pauseAudio();
                          },
                          icon: const Icon(
                            Icons.pause,
                            color: AppColors.primary,
                          ),
                        )
                      else if (bloc.playerState.value != PlayerState.playing)
                        IconButton(
                          onPressed: () {
                            bloc.playAudioFull(
                              urls[bloc.singers
                                  .indexOf(bloc.selectedSinger.value)],
                            );
                          },
                          icon: const Icon(
                            Icons.play_arrow_rounded,
                            color: AppColors.primary,
                          ),
                        ),
                      AnimatedVisibility(
                        show: bloc.playerState.value != PlayerState.stopped,
                        child: IconButton(
                          onPressed: () {
                            bloc.stopAudio();
                          },
                          icon: const Icon(
                            Icons.stop,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark_border,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: state.data?.data.namaLatin ?? '',
                      style: AppStyles.primaryText.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: ' (${state.data?.data.jumlahAyat} Ayat)',
                          style: AppStyles.primaryText.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    TextSpan(
                      text: ' (${state.data?.data.arti})',
                      style: AppStyles.primaryText.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
