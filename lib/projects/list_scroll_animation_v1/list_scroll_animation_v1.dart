import 'package:flutter/material.dart';

const _itemSize = 150.0;

class ListScrollAnimationV1 extends StatefulWidget {
  const ListScrollAnimationV1({Key? key}) : super(key: key);

  @override
  _ListScrollAnimationV1State createState() => _ListScrollAnimationV1State();
}

class _ListScrollAnimationV1State extends State<ListScrollAnimationV1> {
  final scrollController = ScrollController();

  void onListen() {
    setState(() {});
  }

  @override
  void initState() {
    scrollController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              title: Text('Elementos'),
              pinned: true,
              backgroundColor: Colors.grey[600],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final itemPositionOffset = index * (_itemSize * 0.7);
                  final difference =
                      scrollController.offset - itemPositionOffset;
                  final percent =
                      1 - (difference / (_itemSize * 0.7)).clamp(0.0, 1.0);

                  return Align(
                    heightFactor: 0.7,
                    child: Opacity(
                      opacity: percent,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..scale(percent, 1.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          color: Colors.amber,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Elemento $index"),
                              Image.network(
                                "https://i.postimg.cc/qRg8HzQ4/galva.png",
                                height: _itemSize,
                                width: _itemSize,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
