import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Models.dart';

class API extends StatefulWidget {
  const API({super.key});

  @override
  State<API> createState() => _APIState();
}

class _APIState extends State<API> {

  List<User> users = [];
  List<Post> posts = [];

  @override
  Widget build(BuildContext context) {

    return const Placeholder();
  }

  // void fatchData() async{
  //   print('Fetch data');
  //   const url = 'https://randomuser.me/api/?results=20';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final json = jsonDecode(response.body);
  //   final result = json['results'] as List<dynamic>;
  //   setState(() {
  //     users = result.map((e) {
  //       return User(
  //           name: e['name']['first'],
  //           city: e['location']['city']
  //       );
  //     }).toList();
  //   });
  //   print(users[2].name);
  //   print('Fetch completed');
  // }

  void fatchData2() async{
    print('Fetch data');
    const url = 'https://jsonplaceholder.typicode.com/posts?userId=1';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final result = json.decode(response.body) as List<dynamic>;

    setState(() {
      posts = result.map((e) {
        return Post(
            title: e['title'],
            body: e['body']
        );
      }).toList();
    });
    print(result[8]['title']);
    print('Fetch completed');
  }

  // Function to make a CREATE request
  Future<void> createPost() async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      body: jsonEncode(<String, dynamic>{
        'title': 'Flutter HTTP',
        'body': 'Post request example in Flutter',
        'userId': 1,
      }),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);
    if (response.statusCode == 201) {
      print(response.body);
      print('Post created successfully');
    } else {
      throw Exception('Failed to create post');
    }
  }

  // Function to make a PUT request
  Future<void> updatePost() async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      body: jsonEncode(<String, dynamic>{
        'id': 1,
        'title': 'Updated title',
        'body': 'Updated body',
        'userId': 6,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print('Post updated successfully');
      print(response.body);
    } else {
      throw Exception('Failed to update post');
    }
  }

  // Function to make a PATCH request
  Future<void> updatePostPartial() async {
    final response = await http.patch(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      body: jsonEncode(<String, dynamic>{
        'title': 'Partial update',
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print('Post partially updated successfully');
      print(response.body);
    } else {
      throw Exception('Failed to update post partially');
    }
  }


// Function to make a DELETE request
  Future<void> deletePost() async {
    final response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
    );

    if (response.statusCode == 200) {
      print('Post deleted successfully');
    } else {
      throw Exception('Failed to delete post');
    }
  }


}


