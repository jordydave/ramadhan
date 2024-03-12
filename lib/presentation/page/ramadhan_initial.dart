import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ramadhan_app/core/routes/routes.dart';
import 'package:ramadhan_app/presentation/page/home/home_worker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RamadhanInitial extends StatelessWidget {
  const RamadhanInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, device) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (context, orientation) {
                return GetMaterialApp(
                  defaultTransition: Transition.cupertino,
                  debugShowCheckedModeBanner: false,
                  navigatorKey: Get.key,
                  getPages: Routes.list,
                  initialRoute: HomePage.page,
                  theme: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                    brightness: Brightness.light,
                    fontFamily: 'Poppins',
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      centerTitle: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarBrightness: Brightness.light,
                        statusBarColor: Colors.transparent,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
