import 'package:flutter/material.dart';
import 'package:flutter_challenge/projects/vinil_animation/class_album.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class HomeVinil extends StatefulWidget {
  const HomeVinil({Key? key}) : super(key: key);

  @override
  _HomeVinilState createState() => _HomeVinilState();
}

class _HomeVinilState extends State<HomeVinil> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: _MyVinyDiscHeader(),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(Album.currentAlbum.description),
              ),
            )
          ],
        ),
      ),
    );
  }
}

const _maxHeaderExtent = 250.0;
const _minHeaderExtent = 100.0;

const _maxImageSize = 150.0;
const _minImageSize = 60.0;

const _leftMarginDisc = 150.0;

const _maxTitleSize = 25.0;
const _maxSubtitleSize = 18.0;
const _minTitleSize = 20.0;
const _minSubtitleSize = 15.0;

class _MyVinyDiscHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxHeaderExtent;
    final size = MediaQuery.of(context).size;
    final currenSizeImage =
        (_maxImageSize * (1 - percent)).clamp(_minImageSize, _maxImageSize);
    final titleSize = (_maxTitleSize * (1 - percent)).clamp(_minTitleSize, _maxTitleSize);
    final subTitleSize = (_maxSubtitleSize * (1 - percent)).clamp(_minSubtitleSize, _maxSubtitleSize);

    return Container(
      color: Colors.orange[50],
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: size.width / 4,
            height: _maxImageSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Album.currentAlbum.artist,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleSize,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  Album.currentAlbum.album,
                  style: TextStyle(
                    fontSize: subTitleSize,
                    letterSpacing: -0.3,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: Transform.rotate(
              child: Image.network(Album.currentAlbum.imageDisc),
              angle: vector.radians(360 * percent),
            ),
            bottom: 20, 
            left: (_leftMarginDisc * (1-percent)).clamp(35, _leftMarginDisc),
            height: currenSizeImage,
          ),
          Positioned(
            child: Image.network(Album.currentAlbum.imageAlbum),
            bottom: 20,
            left: 35,
            height: currenSizeImage,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => _maxHeaderExtent;

  @override
  double get minExtent => _minHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
