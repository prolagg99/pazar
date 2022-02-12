import 'package:flutter/material.dart';

class MainCollapsingToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: const Text('Demo'),
                  pinned: true,
                  expandedHeight: 150.0,
                  forceElevated: innerBoxIsScrolled,
                ),
              ),
            ];
          },
          body: CustomScrollView(
            slivers: <Widget>[
              Builder(builder: (context) {
                return SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                );
              }),
              SliverToBoxAdapter(
                  child: Container(
                color: Colors.amber,
                height: 100,
              )),
            ],
          )),
    ));
  }
}
