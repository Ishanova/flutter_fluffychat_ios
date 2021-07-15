import 'package:flutter/cupertino.dart';
import 'package:flutter_fluffychat_ios/helper/colors.dart';
import 'package:flutter_fluffychat_ios/helper/indicator.dart';
import 'package:flutter_fluffychat_ios/test_data/test_data.dart';



class CustomTabs extends StatefulWidget {
  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {

  int _selectedPage = 0;
  PageController _pageController;

  void _changePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
      _pageController.animateToPage(
        pageNum,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 45,
            // padding: EdgeInsets.symmetric(
            //   vertical: 12.0,
            // ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: me.folders.length,
              itemBuilder: (BuildContext context, int item) =>
              TabButton(
                text: me.folders.toList()[item].folderName,
                pageNumber: item,
                selectedPage: _selectedPage,
                onPressed: () {
                  _changePage(item);
                },
              ),
            ),
          ),
          Expanded(
            child: PageView(
              onPageChanged: (int page) {
                setState(() {
                  _selectedPage = page;
                });
              },
              controller: _pageController,
              children: [
                Container(
                  child: Center(
                    child: Text("Page 1",
                      style: TextStyle(
                        color: black
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text("Page 2",
                      style: TextStyle(
                          color: black
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
class TabButton extends StatelessWidget {
  final String text;
  final int selectedPage;
  final int pageNumber;
  final Function onPressed;
  TabButton({this.text, this.selectedPage, this.pageNumber, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(
            milliseconds: 1000
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: Color(0x00000000),
          border: selectedPage == pageNumber ? Border(
              bottom: BorderSide(width: 2, color: blue)
          ) : null,
        ),
        padding: EdgeInsets.symmetric(
          vertical: selectedPage == pageNumber ? 12.0 : 0,
          horizontal: selectedPage == pageNumber ? 20.0 : 0,
        ),
        margin: EdgeInsets.symmetric(
          vertical: selectedPage == pageNumber ? 0 : 12.0,
          horizontal: selectedPage == pageNumber ? 0 : 20.0,
        ),
        child: Row(
          children: [
            Text(
              text ?? "Tab Button",
              style: TextStyle(
                  color: black,
                // color: selectedPage == pageNumber ? CupertinoColors.white : CupertinoColors.white,
              ),
            ),
            Indicator(1, 5),
          ],
        ),
      ),
    );
  }
}
