part of '../detail_surat_worker.dart';

class _BodySurat extends StatelessWidget {
  final DetailSuratBloc bloc;
  const _BodySurat({required this.bloc});

  @override
  Widget build(BuildContext context) {
    var state = bloc.detailSuratCase.value;

    return ListView.builder(
      itemCount: state.data?.data.ayat.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${state.data?.data.ayat[index].nomorAyat.toString()}',
                    style: AppStyles.primaryText.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: context.width * 0.65,
                        ),
                        child: Text(
                          state.data?.data.ayat[index].teksArab ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                          style: AppStyles.primaryText.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Obx(() {
                        return Column(
                          children: [
                            AnimatedVisibility(
                              show:
                                  bloc.currentPlayingAyatIndex.value == index &&
                                      bloc.playerAyatState[index] !=
                                          PlayerState.completed,
                              child: IconButton(
                                onPressed: () {
                                  bloc.pauseAudioAyat(index);
                                },
                                icon: const Icon(
                                  Icons.pause,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            AnimatedVisibility(
                              show: bloc.currentPlayingAyatIndex.value ==
                                      null ||
                                  bloc.currentPlayingAyatIndex.value == index,
                              child: IconButton(
                                onPressed: () {
                                  bloc.playAudioAyat(
                                    state.data?.data.ayat[index].audio.first ??
                                        '',
                                    index,
                                  );
                                },
                                icon: const Icon(
                                  Icons.volume_up,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            AnimatedVisibility(
                              show: bloc.playerAyatState[index] ==
                                  PlayerState.paused,
                              child: IconButton(
                                onPressed: () {
                                  bloc.stopAudioAyat(index);
                                },
                                icon: const Icon(
                                  Icons.stop,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        );
                      })
                    ],
                  ),
                ],
              ),
              Text(
                state.data?.data.ayat[index].teksLatin ?? '',
                style: AppStyles.primaryText.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                state.data?.data.ayat[index].teksIndonesia ?? '',
                style: AppStyles.primaryText.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
