class StorageService {
  Future<bool> saveData() async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }
}
