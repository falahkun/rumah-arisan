part of 'widgets.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String _memberToken = Provider.of<String>(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 6,
                spreadRadius: 1,
                offset: Offset(0, 0),
                color: Colors.black.withOpacity(0.1)),
          ]),
      height: 45,
      width: double.infinity,
      child: TextField(
        onTap: () {
          Get.to(SearchPage(
            memberToken: _memberToken,
          ));
          // Navigator.pushNamed(context, Routes.searchPage);
        },
        enabled: false,
        decoration: InputDecoration(
            hintText: "Search",
            hintStyle: regular.copyWith(color: Colors.black38, fontSize: 14),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
