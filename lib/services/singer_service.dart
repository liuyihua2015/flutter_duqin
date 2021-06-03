import 'package:duqin/http/http.dart';

class SingerService {
  static const String rootPath = '/api/user';
  static const String listPath = '$rootPath/list';
  static const String infoPath = '$rootPath/info';

  /// 列表请求
  static Future getUsers({
    int page = 1,
    int limit = 10,
    String type,
  }) async {
    final response = await Http.post(
      listPath,
      data: {'limit': limit, 'page': page, 'type': type},
    );
    Map<String, dynamic> result = response['page'];
    return result;
  }

// /// 详情请求
// static Future getSongInfo(int id) async {
//   final response = await Http.get('$infoPath/$id');
//   Map<String, dynamic> info = response['info'];
//   return info;
// }
}
