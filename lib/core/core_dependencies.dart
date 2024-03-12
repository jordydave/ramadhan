import 'package:get/get.dart';
import 'package:ramadhan_app/core/http_inspector/http_inspector.dart';
import 'package:ramadhan_app/network/http_util/http_util.dart';
import 'package:ramadhan_app/network/http_util/http_util_impl.dart';

class CoreDependencies {
  CoreDependencies() {
    Get.put(HttpInspector());
    Get.put<HttpUtil>(
      HttpUtilImpl(httpInspector: Get.find()),
      permanent: true,
    );
    Get.find<HttpInspector>().initialize();
  }
}
