import 'package:flutter/material.dart';
import 'package:rssbhargav/pages/meme_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: TabBar(
                tabs: const [
                  Tab(
                    text: "Memes",
                  ),
                  Tab(text: "News"),
                  Tab(text: "india"),
                ],
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                indicatorSize: TabBarIndicatorSize.label,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                indicatorWeight: 3,
              ),
            ),
          ),
          body: TabBarView(
            children: [
              MemePage(),
              const Center(child: Text("Request")),
              const Center(child: Text("Request"))
            ],
          )),
    );
  }
}
