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

//数字转为12
String formatCharCount(int count) {
  if (count == null || count <= 0 || count.isNaN) {
    return '0';
  }

  String strCount = count.toString();

  if (strCount.length >= 5) {
    String prefix = strCount.substring(0, strCount.length - 4);

    if (strCount.length == 5) {
      prefix += '.${strCount[1]}';
    }
    if (strCount.length == 6) {
      prefix += '.${strCount[2]}';
    }
    return prefix + 'w';
  }
  return strCount;
}
