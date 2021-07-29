import 'package:flutter/material.dart';

final backgroundColors = [
  Color(0xff8122bf),
  Color(0xffca32f5),
  Color(0xfff2b634),
];

class MainSocialShareButton extends StatelessWidget {
  const MainSocialShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: backgroundColors,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SocialShareButton(
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(Icons.ice_skating),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.facebook),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.lock_clock),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.face),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialShareButton extends StatefulWidget {
  final double height;
  final List<Widget> children;
  final Color childrenColor;
  final TextStyle buttonStyle;
  final Color buttonColor;

  const SocialShareButton({
    Key? key,
    this.height = 100,
    required this.children,
    this.childrenColor = Colors.white,
    this.buttonColor = Colors.black,
    this.buttonStyle = const TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
  }) : super(key: key);

  @override
  _SocialShareButtonState createState() => _SocialShareButtonState();
}

class _SocialShareButtonState extends State<SocialShareButton> {
  final _buttonKey = GlobalKey();
  double _buttonWidth = 0.0;
  bool _expanded = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _buttonWidth = _buttonKey.currentContext!.size!.width + 15;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movement = widget.height / 4;
    return TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 400),
        tween: _expanded
            ? Tween(begin: 0.0, end: 1.0)
            : Tween(begin: 1.0, end: 0.0),
        builder: (context, value, _) {
          return Container(
            height: widget.height,
            child: Column(
              children: [
                Transform.translate(
                  offset: Offset(0.0, movement * value),
                  child: Container(
                    decoration: BoxDecoration(
                        color: widget.childrenColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25))),
                    height: widget.height / 2,
                    child: Row(
                      key: _buttonKey,
                      mainAxisSize: MainAxisSize.min,
                      children: widget.children,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0.0, -movement * value),
                  child: Material(
                    elevation: 15,
                    color: widget.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _expanded = !_expanded;
                        });
                      },
                      splashColor: Colors.green,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        height: widget.height / 2,
                        width: _buttonWidth,
                        alignment: Alignment.center,
                        child: Text(
                          'SHARE',
                          style: widget.buttonStyle,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
