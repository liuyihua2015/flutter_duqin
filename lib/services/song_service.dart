import 'package:duqin/http/http.dart';

class SongService {
  static const String rootPath = '/api/song';
  static const String listPath = '$rootPath/list';
  static const String infoPath = '$rootPath/info';

  /// 列表请求
  static Future getSongs({int page = 1}) async {
    final response = await Http.post(
      listPath,
      data: {'limit': 10, 'page': page},
    );
    Map<String, dynamic> result = response['page'];
    return result;
  }

  /// 详情请求
  static Future getSongInfo(int id) async {
    final response = await Http.get('$infoPath/$id');
    Map<String, dynamic> info = response['info'];
    return info;
  }
}
