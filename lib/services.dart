import 'package:dio/dio.dart';

import 'person.dart';
import 'post.dart';

abstract class Services {
  static Future<Person?> getUserById(int id) async {
    try {
      var response = await Dio().get('https://reqres.in/api/users/$id');

      if (response.statusCode == 200) {
        return Person(
          id: response.data['data']['id'],
          name: response.data['data']['first_name'] +
              ' ' +
              response.data['data']['last_name'],
          email: response.data['data']['email'],
        );
      }

      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Person?> createUser(
      String firstName, String lastName, String email) async {
    try {
      var response = await Dio().post('https://reqres.in/api/users', data: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
      });

      if (response.statusCode == 201) {
        return Person(
          id: int.tryParse(response.data['id'].toString()) ?? 0,
          name: response.data['first_name'] + ' ' + response.data['last_name'],
          email: response.data['email'],
        );
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<Person?>?> fetchUsers() async {
    try {
      var response = await Dio().get('https://reqres.in/api/users?page=2');

      if (response.statusCode == 200) {
        List data = response.data['data'];
        List<Person?> persons = data
            .map((personData) => Person(
                id: personData['id'],
                name: personData['first_name'] + ' ' + personData['last_name'],
                email: personData['email']))
            .toList();
        return persons;
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<Post?>> fetchPost() async {
    Response response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');
    List data = response.data;
    List<Post> posts = data.map((e) => Post.fromJson(e)).toList();
    return posts;
  }
}
