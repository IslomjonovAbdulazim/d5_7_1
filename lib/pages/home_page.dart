import 'package:d5_7_1/models/post_model.dart';
import 'package:d5_7_1/services/network_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variables
  bool isLoading = false;
  List<PostModel> posts = [];

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    isLoading = true;
    setState(() {});
    posts = await NetworkService().getAllPosts();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final model = posts[index];
                    return Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "UserId: ${model.userId}, Post Id: ${model.id}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            model.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            model.body,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
