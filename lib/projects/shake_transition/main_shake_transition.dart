import 'package:flutter/material.dart';

class ShakeTransition extends StatefulWidget {
  const ShakeTransition({Key? key}) : super(key: key);

  @override
  _ShakeTransitionState createState() => _ShakeTransitionState();
}

class _ShakeTransitionState extends State<ShakeTransition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShakeTransitionItem(
                  duration: Duration(milliseconds: 2000),
                  axis: Axis.vertical,
                  offset: -400,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                      'https://i.postimg.cc/DfJqC48c/logo.png',
                      height: 150,
                      width: 150,
                    ),
                  )),
              ShakeTransitionItem(
                duration: Duration(milliseconds: 1800),
                child: Text(
                  "Galva",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              ShakeTransitionItem(
                axis: Axis.vertical,
                offset: 500,
                duration: Duration(milliseconds: 1500),
                child: ElevatedButton(
                  child: Text("Presione aqui"),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShakeTransitionItem extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;

  const ShakeTransitionItem({
    Key? key,
    this.duration = const Duration(milliseconds: 800),
    this.offset = 140,
    this.axis = Axis.horizontal,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0),
      child: child,
      duration: duration,
      curve: Curves.elasticOut,
      builder: (context, value, _child) {
        return Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset((value * offset), 0.0)
              : Offset(0.0, (value * offset)),
          child: child,
        );
      },
    );
  }
}
