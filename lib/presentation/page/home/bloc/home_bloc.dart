part of 'home_extender.dart';

class HomeBloc extends GetxController with _Extender {
  final AllSuratUsecase allSuratUsecase;

  HomeBloc({required this.allSuratUsecase});

  @override
  void onInit() {
    super.onInit();
    getAllSurat();
  }

  void getAllSurat() async {
    allSuratCase(LoadingCase());
    final response = await allSuratUsecase.getAllSurat();
    response.fold(
      (error) => allSuratCase(ErrorCase(error)),
      (data) {
        return allSuratCase(LoadedCase(data));
      },
    );
  }

  String greetingMessage() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Assalamu\'alaikum, User!';
    }
    if (hour < 17) {
      return 'Selamat Siang, User!';
    }
    return 'Selamat Malam, User!';
  }
}
