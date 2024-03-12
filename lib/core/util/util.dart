import 'dart:async';
import 'package:get/get.dart';
import 'package:ramadhan_app/core/case/case.dart';
import 'package:ramadhan_app/core/extension/extension.dart';

class Util {
  static Worker listen<T>({
    required RxInterface<Case<T>> listener,
    required WorkerCallback<Case<T>> callback,
    bool withLoading = true,
  }) {
    StreamSubscription sub = listener.listen(
      (event) {
        if (withLoading) Util.loading(event);
        callback(event);
      },
    );
    return Worker(sub.cancel, '[ever]');
  }

  static void loading(Case state) {
    if (state is LoadingCase) {
      Get.closeLoading();
      Get.showLoading();
    } else if (state is LoadedCase || state is ErrorCase) {
      Get.closeLoading();
    }
  }
}
