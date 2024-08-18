import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RepoController extends GetxController {
  final repoList = [].obs;
  final isLoading = false.obs;

  void fetchRepos(String username) async {
    isLoading.value = true;
    final response = await http.get(
        Uri.parse('https://api.github.com/users/$username/repos'));

    if (response.statusCode == 200) {
      repoList.value = json.decode(response.body);
    } else {
      repoList.value = [];
    }
    isLoading.value = false;
  }
}