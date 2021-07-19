import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';
import 'package:flutter_fluffychat_ios/search/search_logic.dart';

class CupertinoSearchDelegate extends AbstractPlatformSearchDelegate {
  final List<SearchItem> Function(String text) search;
  CupertinoSearchDelegate(this.search);
  Widget buildActions(BuildContext context) {
    return CupertinoButton(
      child: const Text('Отменить'),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      onPressed: () {
        close(context, null);
      },
    );
  }

  Widget buildResults(BuildContext context) {
    final List<SearchItem> result = search(query);
    return SearchItemsWidget(result);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image2.png",
              width: 80,
              height: 80,
            ),
            Container(
              width: 0,
              height: 20,
            ),
            Text(
              'Начни искать по ФИО, номеру ИСУ\nили учебной группе',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                  color: transparentGrey,
                  fontSize: 13,
                  fontFamily: "SFProText",
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
    /*final List<SearchItem> result = search(query);
    return SearchItemsWidget(result);*/
  }

  @override
  Widget buildScaffold(Widget body, BuildContext context) {
    return CupertinoPageScaffold(
      // backgroundColor: white,
      navigationBar: CupertinoNavigationBar(
        // backgroundColor: white,
        padding: EdgeInsetsDirectional.only(start: 0),
        transitionBetweenRoutes: true,
        leading: SizedBox.shrink(),
        middle: CupertinoSearchTextField(
          // padding: EdgeInsets.only(left: 6, top: 10, right: 12, bottom: 6),
          prefixInsets: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          placeholder: 'Поиск',
          placeholderStyle: TextStyle(
              color: darkText_secondary,
              fontSize: 17,
              fontFamily: "SFProText",
              fontWeight: FontWeight.normal),
          controller: queryTextController,
          focusNode: focusNode,
          onChanged: (String _) {
            showResults(context);
          },
          style: TextStyle(
              color: darkText_secondary,
              fontSize: 17,
              fontFamily: "SFProText",
              fontWeight: FontWeight.normal),
        ),
        trailing: CupertinoButton(
          child: const Text('Отменить'),
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          onPressed: () {
            close(context, null);
          },
        ),
      ),
      child: body ?? Container(),
    );
  }
}

class SearchItem {
  final String name;
  final Widget asset;

  const SearchItem(this.name, this.asset);
}

class SearchItemsWidget extends StatelessWidget {
  final List<SearchItem> items;

  const SearchItemsWidget(this.items);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        var item = items[index];
        return SearchItemWidget(item);
      },
    );
  }
}

class SearchItemWidget extends StatelessWidget {
  final SearchItem item;
  final bool small;
  const SearchItemWidget(this.item, {this.small = false});
  @override
  Widget build(BuildContext context) {
    return small
        ? Container(
            color: white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Text(
                item.name,
              ),
            ),
          )
        : Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Row(
                  children: [
                    item.asset,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        item.name,
                        style: TextStyle(color: black),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          );
  }
}
