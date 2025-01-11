import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mashwerni/core/class/statusrequest.dart';
import 'package:mashwerni/core/constant/imageasset.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest? statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Lottie.asset(AppImageAsset.loading)
        : statusRequest == StatusRequest.offlinefailure
            ? Lottie.asset(AppImageAsset.offline1)
            : statusRequest == StatusRequest.serverFailure
                ? Lottie.asset(AppImageAsset.serverFailure2)
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(
                        AppImageAsset.noDataFound,
                      ))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest? statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Lottie.asset(AppImageAsset.loading)
        : statusRequest == StatusRequest.offlinefailure
            ? Lottie.asset(AppImageAsset.offline1)
            : statusRequest == StatusRequest.serverFailure
                ? Lottie.asset(AppImageAsset.serverFailure2)
                : widget;
  }
}
