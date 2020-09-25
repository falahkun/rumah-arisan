part of 'widgets.dart';

class ArisanHorizontalItem extends StatelessWidget {
  final String imageUrl, title, installments, quota, joinedMember;

  const ArisanHorizontalItem(
      {Key key,
      this.imageUrl,
      this.title,
      this.installments,
      this.quota = "0",
      this.joinedMember = "0"})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      padding: const EdgeInsets.only(top: 6, left: 6, right: 14, bottom: 16),
      width: MediaQuery.of(context).size.width - 40,
      height: 85,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath.shape(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            child: Image.network(
              imageUrl ?? placeHolderImageUrl(title),
              height: 63,
              width: 63,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: bold.copyWith(
                  fontSize: 13,
                ),
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    priceFormating(installments),
                    style: regular.copyWith(fontSize: 13),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                  ),
                  Text(
                    "$joinedMember/$quota Orang",
                    style: regular.copyWith(
                        fontSize: 12, color: Color(0xFFFF5050)),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
