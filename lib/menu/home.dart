import 'package:flutter/material.dart';
import 'package:flutter_challenge/projects/list_projects.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Color(0xFF212239),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Mis proyectos - My projects",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                transitionBuilder: (widget, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: widget,
                  );
                },
                child: orientation == Orientation.portrait
                    ? ListView.builder(
                        itemCount: ListProjects.list_project.length,
                        itemBuilder: (context, index) {
                          return _CardItem(
                            color: Colors
                                .primaries[index % Colors.primaries.length],
                            index: index,
                          );
                        },
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: ListProjects.list_project.length,
                        itemBuilder: (context, index) {
                          return _CardItem(
                            color: Colors
                                .primaries[index % Colors.primaries.length],
                            index: index,
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  final Color color;
  final int index;

  const _CardItem({Key? key, required this.color, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ListProjects.list_project[index].page),
          );
        },
        child: Container(
          height: 160,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [color.withOpacity(.5), color]),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Vinil Animation",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
