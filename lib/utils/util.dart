import 'package:get/get.dart';

/// 转为 rpx 单位
///
/// [size] 设计稿上的大小
///
/// [width] 设计稿尺寸
double toRpx({double size = 0, double width = 750}) {
  // 原生：MediaQuery.of(context).size.width / 750;
  double rpx = Get.width / width;
  return size * rpx;
}
