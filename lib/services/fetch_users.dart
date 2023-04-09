import '../model/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers(int page) async {
  final response =
      await http.get(Uri.parse('https://reqres.in/api/users?page=$page'));

  if (response.statusCode == 200) {
    List<User> users = [];
    final jsonData = json.decode(response.body);
    final usersList = jsonData['data'];

    for (var user in usersList) {
      users.add(User.fromJson(user));
    }

    return users;
  } else {
    throw Exception('Failed to load users');
  }
}
