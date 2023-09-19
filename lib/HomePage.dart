// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Sidebaricon {
  String name;
  IconData iconData;
  Sidebaricon({
    required this.name,
    required this.iconData,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // final int index;

  // const HomePage({super.key, required this.index});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Sidebaricon> list = [
    Sidebaricon(name: "Home", iconData: Icons.home),
    Sidebaricon(name: "Search", iconData: Icons.search),
    Sidebaricon(name: "Person", iconData: Icons.person),
    Sidebaricon(name: "Settings", iconData: Icons.settings),
  ];
  List<Widget> widgets = const [
    Center(child: Text("Home")),
    Center(child: Text("search")),
    Center(child: Text("person")),
    Center(child: Text("Settings")),
  ];
  int currettab = 0;
  @override
  void initState() {
    super.initState();
    // updatetab();
  }

  // updatetab() {
  //   setState(() {
  //     currettab = widget.index;
  //   });
  // }

  bool isexpand = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            curve: Curves.easeIn,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black12)),
            duration: const Duration(milliseconds: 300),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isexpand = !isexpand;
                  });
                },
                child: AnimatedContainer(
                  curve: Curves.easeIn,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  duration: const Duration(milliseconds: 300),
                  child: const Icon(Icons.menu),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      list.length,
                      (index) {
                        var e = list[index];

                        return GestureDetector(
                          onTap: () {
                            // context.go('/$index');
                            setState(() {
                              currettab = index;
                            });
                          },
                          child: AnimatedContainer(
                            curve: Curves.easeIn,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: currettab == index ? Colors.cyan : null),
                            duration: const Duration(milliseconds: 300),
                            child: Row(
                              children: [
                                Icon(
                                  e.iconData,
                                  color:
                                      currettab == index ? Colors.white : null,
                                ),
                                if (isexpand) ...[
                                  const SizedBox(width: 8),
                                  Text(
                                    e.name,
                                    style: TextStyle(
                                      color: currettab == index
                                          ? Colors.white
                                          : null,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                ]
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Are you sure you want to logout?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Cancel")),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Logout")),
                        ],
                      );
                    },
                  );
                },
                child: AnimatedContainer(
                  curve: Curves.easeIn,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  duration: const Duration(milliseconds: 300),
                  child: const Icon(Icons.logout),
                ),
              ),
            ]),
          ),
          Expanded(child: widgets[currettab]),
        ],
      ),
    );
  }
}
