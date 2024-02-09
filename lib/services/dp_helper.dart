import 'package:dio/dio.dart';
import 'package:temp_intern/models/user.dart';

class DBhelper {
  final Dio dio;
  DBhelper(
    this.dio,
  );

  Future<List<UserModel>> getdate() async {
    try {
      Response response = await dio.get('https://dummyjson.com/users');

      Map<String, dynamic> josnDate = response.data;
      List<dynamic> tempdata = josnDate['users'];
      List<UserModel> uesrsList = [];
      for (var data in tempdata) {
        UserModel userModel = UserModel(
          image: data['image'],
          firstname: data['firstName'],
          lastname: data['lastName'],
          gender: data['gender'],
          username: data['username'],
          email: data['email'],
          password: data['password'],
        );
        uesrsList.add(userModel);
      }
      print('-----suc------');
      print(uesrsList.length);
      return uesrsList;
    } catch (e) {
      print('-----catch------');
      return [];
    }
  }
}
