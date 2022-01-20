import 'package:flutter/material.dart';
import 'package:sliver/academy.dart';

class LearningPageList extends StatelessWidget{
  SliverPersistentHeader _header(String text){
    return SliverPersistentHeader(
        pinned: true,
        delegate: SliverAppBarDelegate(
            minHeight: 60,
            maxHeight: 150,
            child: Container(
              color: Colors.lightBlue,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _header('Android Developer'),
        SliverList(
            delegate: SliverChildListDelegate(
              androidPaths.map(_buildTile).toList()
            )
        ),
        _header('iOS Developer'),
        SliverList(
            delegate: SliverChildListDelegate(
              iosPaths.map(_buildTile).toList()
            )
        ),
        _header('Multi-Platform App Developer'),
        SliverGrid.count(
            crossAxisCount: 2,
            children: flutterPaths.map(_buildTile).toList(),
        ),
        _header('Front-End Web Developer'),
        SliverGrid.count(
            crossAxisCount: 2,
            children: webPaths.map(_buildTile).toList(),
        )
      ],
    );
  }

  Widget _buildTile(Academy academy) {
    return ListTile(
      title: Text(academy.title),
      subtitle: Text(academy.description),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate{
  final double minHeight;
  final double maxHeight;
  final Widget child;

  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}