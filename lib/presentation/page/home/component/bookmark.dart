part of '../home_worker.dart';

class _BookmarkTab extends StatelessWidget {
  final HomeBloc bloc;
  const _BookmarkTab({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
            // Get.toNamed(
            //   DetailSuratPage.page,
            //   arguments: DetailSuratArgument(
            //     nomor: index + 1,
            //   ),
            // );
          },
          leading: Text(
            (index + 1).toString(),
            style: AppStyles.secondaryTextLight.copyWith(fontSize: 20),
          ),
          title: Text(
            'Surah ${index + 1}',
            style: AppStyles.primaryText.copyWith(fontSize: 20),
          ),
          subtitle: Text(
            'Mekkah - 7 Ayat',
            style: AppStyles.secondaryText.copyWith(fontSize: 15),
          ),
          trailing: Text(
            'Al-Fatihah',
            style: AppStyles.primaryText.copyWith(fontSize: 15),
          ),
        );
      },
    );
  }
}
