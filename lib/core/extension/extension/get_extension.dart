part of '../extension.dart';

extension GetExtension on GetInterface {
  void lazy<T>(T object) {
    (this).lazyPut<T>(() => object, fenix: true);
  }

  void closeLoading() {
    while (((this).isDialogOpen ?? false)) {
      (this).back();
    }
  }

  void showLoading() {
    (this).dialog(
      Dialog(
        elevation: 0.0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.grey.withOpacity(0.2),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
          child: Center(
            child: LoadingAnimationWidget.horizontalRotatingDots(
              color: AppColors.primary,
              size: 8.h,
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void successToast(String text) {
    Flushbar(
      message: text,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(10),
      backgroundColor: AppColors.green,
      icon: const Icon(
        Icons.check_circle,
        size: 28.0,
        color: AppColors.white,
      ),
    ).show(Get.context!);
  }

  Future<dynamic> error({
    String title = "Maaf, terjadi kesalahan",
    String description = '',
    String textButton = "Okay",
    bool dismissable = true,
  }) async {
    final result = await Get.bottomSheet(
      ErrorSheet(
        content: description.isEmpty ? null : description,
        title: title,
        textButton: textButton,
      ),
      isDismissible: dismissable,
    );
    return result;
  }
}
