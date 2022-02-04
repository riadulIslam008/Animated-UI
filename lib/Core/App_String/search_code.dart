class SearchUI {
  static const String code = '''

  import 'package:flutter/material.dart

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              floating: true,
              pinned: false,
              delegate: SearchByHeader(
                stackPaddingTop: 170,
                titlePaddingTop: 0,
                stackChild: Container(
                  decoration: const BoxDecoration(
                    color: AppColor.whiteColor, //Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.black12, //Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    minLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      prefixIcon: const Icon(AppIcon.searchIcon), //Icons.search
                      hintText: 'Search',
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(AppIcon.clearIcon, // Icons.clear
                            color: AppColor.greyColor), //Colors.grey
                      ),
                    ),
                    onSubmitted: (String value) {},
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: AppColor.greyColor100, //Colors.blueGrey[100]
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 10,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        color: AppColor.whiteColor, //Colors.white,
                        padding: const EdgeInsets.only(top: 5.0),
                        
                        //!!! ======================Must be Changed this widget
                        child: Container(
                          height: 200,
                          width: 100,
                          color: AppColor.greyColor300, //Colors.grey[300],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchByHeader extends SliverPersistentHeaderDelegate {
  final double flexibleSpace;
  final double backGroundHeight;
  final double stackPaddingTop;
  final double titlePaddingTop;
  final Widget stackChild;

  SearchByHeader({
    this.flexibleSpace = 220,
    this.backGroundHeight = 0,
    required this.stackPaddingTop,
    this.titlePaddingTop = 0,
    required this.stackChild,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var percent = shrinkOffset / (maxExtent - minExtent);
    double calculate = 1 - percent < 0 ? 0 : (1 - percent);
    return SizedBox(
      height: maxExtent,
      child: Stack(
        children: <Widget>[
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: AppColor.gradiantCoverBox,
            ),
          ),
          Positioned(
            top: 120,
            child: Opacity(
              opacity: calculate,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: stackChild,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => flexibleSpace;

  @override
  double get minExtent => kToolbarHeight + 25;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
  ''';
}
