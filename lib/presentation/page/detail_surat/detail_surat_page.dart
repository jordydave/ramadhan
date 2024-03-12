part of 'detail_surat_worker.dart';

class DetailSuratPage extends GetState<DetailSuratBloc> with _Worker {
  static const page = '/detail_surat_page';
  DetailSuratPage({super.key});

  @override
  void registerStateEffect(BuildContext currentContext) {
    (this).disposables.addAll(workers);
    super.registerStateEffect(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return GetStateBuilder<DetailSuratBloc>(
      container: this,
      context: context,
      init: bloc,
      builder: (bloc) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'Detail Surat',
              style: AppStyles.primaryText.copyWith(fontSize: 20),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: _Body(bloc: bloc),
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  final DetailSuratBloc bloc;
  const _Body({required this.bloc});

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

      if (urls.isNotEmpty && state.data != null) {
        bloc.singers.value = urls.map((url) {
          List<String> parts = url.split('/');
          if (parts.isNotEmpty) {
            return parts[parts.length - 2];
          } else {
            return '';
          }
        }).toList();

        if (bloc.singers.isNotEmpty && bloc.selectedSinger.value == null) {
          bloc.selectedSinger.value = bloc.singers[0];
        }
      }
      if (state.data != null) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      var prevSurat = state.data?.data.suratSebelumnya;
                      if (prevSurat is NextPrevSurat) {
                        bloc.getDetailSurat(prevSurat.nomor);
                        bloc.player.stop();
                        bloc.playerAyat.stop();
                      }
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  IconButton(
                    onPressed: () {
                      var nextSurat = state.data?.data.suratSelanjutnya;
                      if (nextSurat is NextPrevSurat) {
                        bloc.getDetailSurat(nextSurat.nomor);
                        bloc.player.stop();
                        bloc.playerAyat.stop();
                      }
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            _Header(bloc: bloc),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(() {
                if (bloc.selectedSinger.value != null &&
                    bloc.singers.isNotEmpty) {
                  return DropdownButtonFormField(
                    value: bloc.selectedSinger.value,
                    items: bloc.singers.map((singer) {
                      return DropdownMenuItem(
                        value: singer,
                        child: Text(singer),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      if (value != null) {
                        int index = bloc.singers.indexOf(value);
                        if (index != -1) {
                          bloc.selectedSinger.value = value;
                          bloc.playAudioFull(urls[index]);
                        }
                      }
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ),
            Expanded(
              child: _BodySurat(bloc: bloc),
            ),
          ],
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
