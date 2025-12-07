import 'package:get_storage/get_storage.dart';

class AppStorage {
  static final _box = GetStorage();


  static String key="keyIsPremium";
  // new keys added

  static Future<void> saveValue({
    required String key,
    required dynamic value,
  }) async {
    await _box.write(key, value);
  }

  static dynamic getValue({required String key}) {
    return _box.read<dynamic>(key);
  }


}
