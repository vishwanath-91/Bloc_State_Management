import 'package:cubit_api_project/Model/UserModel.dart';
import 'package:http/http.dart' as http;

class UserRepoData {
  Future<List<UserModel>> getUserData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      final userModelData = userModelFromJson(response.body);
      return userModelData;
    } else {
      throw Exception("faild to load data");
    }
  }
}
