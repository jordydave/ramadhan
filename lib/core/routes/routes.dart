import 'package:get/get.dart';
import 'package:ramadhan_app/presentation/page/detail_surat/bloc/detail_surat_extender.dart';
import 'package:ramadhan_app/presentation/page/detail_surat/detail_surat_worker.dart';
import 'package:ramadhan_app/presentation/page/home/bloc/home_extender.dart';
import 'package:ramadhan_app/presentation/page/home/home_worker.dart';
import 'package:ramadhan_app/presentation/page/splash/bloc/splash_extender.dart';
import 'package:ramadhan_app/presentation/page/splash/splash_worker.dart';

class Routes {
  static List<GetPage> get list {
    return [
      GetPage(
        name: SplashPage.page,
        page: () => SplashPage(),
        binding: BindingsBuilder(() {
          Get.put(SplashBloc());
        }),
      ),
      GetPage(
        name: HomePage.page,
        page: () => HomePage(),
        binding: BindingsBuilder(() {
          Get.put(HomeBloc(allSuratUsecase: Get.find()));
        }),
      ),
      GetPage(
        name: DetailSuratPage.page,
        page: () => DetailSuratPage(),
        binding: BindingsBuilder(() {
          Get.put(DetailSuratBloc(
            detailSuratUsecase: Get.find(),
            argument: Get.arguments,
          ));
        }),
      ),
    ];
  }
}
