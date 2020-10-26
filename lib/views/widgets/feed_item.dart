part of 'widgets.dart';

class FeedItem extends StatelessWidget {
  final CfData model;

  const FeedItem({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Colors.white),
        height: 170,
        width: MediaQuery.of(context).size.width - 40,
        child: Row(
          children: [
            ClipPath.shape(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: Image.network(
                model.konten.first.tipe == 'foto'
                    ? model.konten.first.url
                    : placeHolderImageUrl(model.nama),
                height: 153,
                width: 153,
                fit: BoxFit.cover,
              ),
            ),
            _buildArticleDescription(context, model),
          ],
        ),
      ),
    );
  }
}

Widget _buildArticleDescription(BuildContext context, CfData model) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(
          left: 8,
          top: 5,
        ),
        width: MediaQuery.of(context).size.width - 20 - 40 - 153 - 16,
        child: Text(
          model.nama,
          style: bold.copyWith(fontSize: 16),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          left: 8,
          top: 5,
        ),
        width: MediaQuery.of(context).size.width - 20 - 40 - 153 - 16,
        child: Text(
          model.teks,
          style: regular.copyWith(fontSize: 14),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
