/*
import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/search/cupertino_style_search.dart';
import 'package:flutter_fluffychat_ios/search/search_logic.dart';

import 'appBarView.dart';

class CupertinoSearch extends StatefulWidget {
  final List<SearchItem> Function(String text) search;

  CupertinoSearch(this.search);

  @override
  _CupertinoSearchState createState() => _CupertinoSearchState();
}

class _CupertinoSearchState extends State<CupertinoSearch> {
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        showPlatformSearch(
          context: context,
          delegate: CupertinoSearchDelegate(widget.search),
        );
      }
      _focusNode.unfocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              */
/*CupertinoSliverNavigationBar(
                border: Border.all(width: 0.0, color: transparent),
                largeTitle: Text('Search'),
                backgroundColor: white,
                transitionBetweenRoutes: true,
              ),*//*

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: GestureDetector(
                    onTap: () {
                      showPlatformSearch(
                        context: context,
                        delegate: CupertinoSearchDelegate(widget.search),
                      );
                    },
                    child: CupertinoSearchTextField(
                      focusNode: _focusNode,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) => SearchItemWidget(items[index]),
                  childCount: items.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/
