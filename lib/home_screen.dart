import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller.dart';


class HomeScreen extends StatelessWidget {
  final TextEditingController _userNameController = TextEditingController();
  final RepoController repoController = Get.put(RepoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Repositories Viewer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_auto),
            onPressed: () {
              Get.changeThemeMode(
                Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(
                hintText: 'Enter GitHub Username',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    repoController.fetchRepos(_userNameController.text);
                  },
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                if (repoController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (repoController.repoList.isEmpty) {
                  return const Center(child: Text('No repositories found.'));
                }
                return ListView.builder(
                  itemCount: repoController.repoList.length,
                  itemBuilder: (context, index) {
                    final repo = repoController.repoList[index];
                    return ListTile(
                      title: Text(repo['name']),
                      subtitle: Text(repo['description'] ?? 'No description'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.yellow),
                          Text('${repo['stargazers_count']}'),
                        ],
                      ),
                      onTap: () {
                        Get.defaultDialog(
                          title: repo['name'],
                          content: Column(
                            children: [
                              Text('Stars: ${repo['stargazers_count']}'),
                              Text('Last Updated: ${repo['updated_at']}'),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}