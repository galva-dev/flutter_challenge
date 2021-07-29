import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FloatingButtonAnimation extends StatefulWidget {
  const FloatingButtonAnimation({Key? key}) : super(key: key);

  @override
  _FloatingButtonAnimationState createState() => _FloatingButtonAnimationState();
}

class _FloatingButtonAnimationState extends State<FloatingButtonAnimation> {

  bool expanded = false;
  final scrollController = ScrollController();

  void _onScrollDirection(){
    if(scrollController.position.userScrollDirection == ScrollDirection.reverse){
      setState(() {
        expanded = false;
      });
    }else if(scrollController.position.userScrollDirection == ScrollDirection.forward){
      setState(() {
        expanded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _FloatingActionButton(
        expanded: expanded,
        onTap: (){
          setState(() {
            expanded = !expanded;
          });
          print(expanded);
        },
      ),
      backgroundColor: Colors.grey[850],
      body: Column(
        children: [
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (details){
                // print("details: ${details.metrics.pixels}");
                _onScrollDirection();
                return true;
              },
              child: ListView.builder(
                controller: scrollController,
                itemCount: 25,
                itemBuilder: (context, index) {
                  return _MessageItem(
                    color: Colors.primaries[index % Colors.primaries.length],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const _duration = Duration(milliseconds: 200);
const _minSize = 50.0;
const _maxSize = 150.0;
const _iconSize = 24.0;

class _FloatingActionButton extends StatefulWidget {
  final bool expanded;
  final VoidCallback onTap;

  const _FloatingActionButton({
    Key? key,
    required this.expanded,
    required this.onTap
  }) : super(key: key);

  @override
  __FloatingActionButtonState createState() => __FloatingActionButtonState();
}

class __FloatingActionButtonState extends State<_FloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: _duration,
        width: widget.expanded ? _maxSize : _minSize,
        height: _minSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(_minSize),
          ),
          color: Colors.blue,
        ),
        child: Stack(
          children: [
            Positioned(
              left: _minSize / 2 - _iconSize / 2,
              top: _minSize / 2 - _iconSize / 2,
              child: Icon(
                Icons.message,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: _minSize / 2 - _iconSize / 2,
              left: (_minSize / 2 - _iconSize / 2) + _iconSize * 1.5,
              child: Text(
                "Start chat",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageItem extends StatelessWidget {
  final Color color;
  const _MessageItem({
    Key? key,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Icon(
          Icons.person,
          color: Colors.black45,
        ),
      ),
      title: Text(
        "516",
        style: TextStyle(
          color: Colors.white60,
        ),
      ),
      subtitle: Text(
        "Registrado!",
        style: TextStyle(
          color: Colors.white60,
        ),
      ),
      trailing: Text(
        "30 min.",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
