part of 'widgets.dart';

class CommunityItem extends StatelessWidget {
  final String urlImage;
  final String title;
  final String privacy;
  final int liked;
  final int rating;
  final int reactedPeople;
  final bool isLiked;

  const CommunityItem(
      {Key key,
      this.urlImage,
      this.title,
      this.privacy,
      this.liked,
      this.rating,
      this.reactedPeople,
      this.isLiked})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: 296,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.45),
                offset: Offset(0, 0))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath.shape(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Image.network(
                urlImage,
                height: 72,
                width: 72,
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: 13,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: (296 - 10 - 13 - 72 - 10).toDouble(),
                child: Text(
                  title ?? "Community Title is very long for mobile view",
                  style: regular.copyWith(
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Container(
                width: 49,
                height: 15,
                child: Center(
                  child: Text(
                    privacy ?? "-",
                    style: regular.copyWith(fontSize: 8, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xFFEB5757)),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: (296 - 10 - 13 - 72 - 10).toDouble(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: Color(0xFFEB5757),
                          size: 16,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          liked == null ? "0" : liked.toString(),
                          style: regular.copyWith(
                              fontSize: 12, color: Color(0xFFEB5757)),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        RatingBar(
                          ignoreGestures: true,
                          initialRating: rating.toDouble(),
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 16,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0),
                          ratingWidget: RatingWidget(
                            full: Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            half: Icon(
                              Icons.star_half,
                              color: Colors.amber,
                              size: 16,
                            ),
                            empty: Icon(
                              Icons.star_border,
                              color: Colors.amber,
                              size: 16,
                            ),
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Text(
                          "(${reactedPeople.toString()})",
                          style: regular.copyWith(
                              fontSize: 12, color: Colors.amber),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
