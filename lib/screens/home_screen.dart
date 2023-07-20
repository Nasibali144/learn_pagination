import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn_pagination/models/api_response.dart';
import 'package:learn_pagination/services/network_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  int exitCounter = 0;
  int page = 0;
  int limit = 20;
  int total = 100;
  bool isLoading = false;
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    getAllUsers();
    controller.addListener(() {
      if (controller.position.pixels >= controller.position.maxScrollExtent
          && ((page + 1) * limit) == users.length) {
        page++;
        debugPrint("page: $page");
        getAllUsers(page: page);
      }
    });
  }

  void getAllUsers({int page = 0}) async {
    setState(() => isLoading = true);
    final query = {
      "limit": "$limit",
      "skip": "${page * limit}",
    };
    final response = await Network.methodGet(api: Network.apiUsers, query: query);
    users.addAll(Network.parseAllUser(response!).users);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Timer(const Duration(seconds: 1), () {
          exitCounter = 0;
        });
        exitCounter++;
        if(exitCounter >= 2) {
          return true;
        }
        return false;
      },
      child: RefreshIndicator(
        onRefresh: () async {
          users = [];
          page = 0;
          getAllUsers();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Users"),
          ),
          body: Stack(
            children: [
              ListView.builder(
                controller: controller,
                padding: const EdgeInsets.all(20),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return UserCard(user: user);
                },
              ),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        minLeadingWidth: 60,
        title: Text(user.username),
        subtitle: Text(user.email),
        trailing: Text(user.id.toString(), style: Theme.of(context).textTheme.headlineMedium,),
        leading: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Image(
            image: NetworkImage(user.image),
            errorBuilder: (context, _, __) {
              return const SizedBox(
                width: 60,
                child: Icon(Icons.warning_rounded),
              );
            },
          ),
        ),
      ),
    );
  }
}
