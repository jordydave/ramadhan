part of '../home_worker.dart';

class _SurahTab extends StatelessWidget {
  final HomeBloc bloc;
  const _SurahTab({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var state = bloc.allSuratCase.value;
      return ListView.builder(
        itemCount: state.data?.dataSurat.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Get.toNamed(
                DetailSuratPage.page,
                arguments: DetailSuratArgument(
                  nomor: state.data?.dataSurat[index].nomor ?? 1,
                ),
              );
            },
            leading: Text(
              state.data?.dataSurat[index].nomor.toString() ?? "",
              style: AppStyles.secondaryTextLight.copyWith(fontSize: 20),
            ),
            title: Text(
              state.data?.dataSurat[index].namaLatin ?? "",
              style: AppStyles.primaryText.copyWith(fontSize: 20),
            ),
            subtitle: Text(
              '${state.data?.dataSurat[index].tempatTurun} - ${state.data!.dataSurat[index].jumlahAyat} Ayat',
              style: AppStyles.secondaryText.copyWith(fontSize: 15),
            ),
            trailing: Text(
              state.data?.dataSurat[index].nama ?? "",
              style: AppStyles.primaryText.copyWith(fontSize: 15),
            ),
          );
        },
      );
    });
  }
}
