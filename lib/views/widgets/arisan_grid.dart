part of 'widgets.dart';

class ArisanGrid extends StatelessWidget {
  final CloterResult cloterResult;
  final String memberToken;

  const ArisanGrid({Key key, this.cloterResult, this.memberToken})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(!cloterResult.status) {
      return Container();
    }
    return StaggeredGridView.countBuilder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      itemCount: cloterResult.data.length,
      itemBuilder: (BuildContext context, int index) => CloterGridItem(
        cloter: cloterResult.data[index],
        memberToken: memberToken,
      ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.fit(1),
      mainAxisSpacing: 20.0,
      crossAxisSpacing: 15.0,
    );
  }
}
