import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_workers/rx_workers.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class GetState<T extends GetxController> extends StatelessWidget {
  final List<Worker> disposables = [];

  GetState({super.key});

  void onDispose(GetBuilderState<T> controller) {
    for (var element in disposables) {
      element.dispose();
    }
  }

  void registerStateEffect(BuildContext currentContext) {}

  void onReady(GetBuilderState<T> controller) {}

  void onDidUpdateWidget(
      GetBuilder<GetxController> builder, GetBuilderState<T> controller) {}

  void onDidChangeDependencies(GetBuilderState<T> controller) {}

  void onViewStateChanges(dynamic state, BuildContext context) {}
}
