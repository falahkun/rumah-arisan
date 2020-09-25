part of 'pages.dart';

class SearchPage extends StatefulWidget {
  final String query;
  final int currentIndex;
  final String slug;
  final String memberToken;

  const SearchPage(
      {Key key,
      this.query = "",
      this.currentIndex = 0,
      this.slug = "",
      @required this.memberToken})
      : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            /// TAG APP BAR
            _buildAppBar(context),
            SizedBox(height: 8),

            /// TAG TAB BAR
            _buildTabBar(context)

            /// TAG BODY
          ],
        ),
      ),
    );
  }

  _buildAppBar(context) {
    return Container(
      height: 69,
      // color: Colors.blue,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
              top: 27,
              left: 20,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset("assets/icons/back_arrow.svg"))),
          Align(
            alignment: Alignment.centerRight,
            child: Hero(
              tag: "search-bar",
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  height: 45,
                  width: MediaQuery.of(context).size.width - 20 - 78,
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 10),
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search),
                        hintStyle: regular.copyWith(
                          fontSize: 14,
                        ),
                        hintText: "Type Somethings..."),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xFFC4C4C4).withOpacity(0.35)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildTabBar(context) {
    return Container(
        height: 20,
        padding: EdgeInsets.only(left: 20),
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(_titles.length, (index) {
              var _title = _titles[index];
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentTab = index;
                    });
                  },
                  child: _tabBarTitle(
                      _title, (currentTab == index) ? true : false));
            })));
  }

  _tabBarTitle(String title, bool active) {
    return Padding(
        padding: const EdgeInsets.only(right: 25),
        child: Text(
          title ?? "-",
          style: active
              ? bold.copyWith(fontSize: 14)
              : regular.copyWith(
                  fontSize: 14, color: Colors.black.withOpacity(0.65)),
        ));
  }

  List<String> _titles = [
    "Owner",
    "Cloter",
    "Katalog",
    "Member",
    "Komunitas",
  ];
}
