

import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/studentModel.dart';

class ApiData{
  // get personal information
  Future<Student> fetchPersonalInfo() async {
    String url = dotenv.get("API",fallback:"");
    SharedPreferences prefs = await SharedPreferences
        .getInstance();
    String? id = prefs.getString('_id');
    final response = await http
        .get(Uri.parse('$url/students/getStudent/$id'));
    var data = jsonDecode(response.body);
    var user = data['data']['student'];

    // return data to student model
    return Student.fromJson(user);
  }
  }