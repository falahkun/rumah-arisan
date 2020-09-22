part of 'widgets.dart';

class DiscussBubble extends StatelessWidget {
  final String date;
  final String imageProfile;
  final String name;
  final String text;
  final bool isReply;
  final List<DiscussBubble> replies;
  final Function onTap;

  const DiscussBubble(
      {Key key,
      this.date,
      this.imageProfile,
      this.name,
      this.text,
      this.isReply = false,
      this.replies,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: isReply ? 20 : 18, right: isReply ? 18 : 20, bottom: 5),
      child: isReply
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 23, top: 10, right: 10, bottom: 10),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: name.split(" ")[0],
                              style: bold.copyWith(
                                  fontSize: 12, color: Colors.black)),
                          TextSpan(
                              text: "\n$text",
                              style: regular.copyWith(
                                  fontSize: 12, color: Colors.black))
                        ])),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.25),
                                offset: Offset(0, 2),
                                spreadRadius: 0)
                          ],
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    ClipPath.shape(
                      shape: CircleBorder(),
                      child: Image.network(
                        imageProfile ?? placeHolderImageUrl(name),
                        width: 35,
                        height: 35,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  date ?? DateTime.now().toString(),
                  style: regular.copyWith(fontSize: 10, color: Colors.black),
                ),
                if (replies != null)
                  SizedBox(
                    height: 5,
                  ),
                if (replies != null)
                  for (var reply in replies) reply
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipPath.shape(
                      shape: CircleBorder(),
                      child: Image.network(
                        imageProfile ?? placeHolderImageUrl(name),
                        width: 35,
                        height: 35,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onLongPress: onTap,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10, top: 10, right: 23, bottom: 10),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: name.split(" ")[0],
                                style: bold.copyWith(
                                    fontSize: 12, color: Colors.black)),
                            TextSpan(
                                text: "\n$text",
                                style: regular.copyWith(
                                    fontSize: 12, color: Colors.black))
                          ])),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: Colors.black.withOpacity(0.25),
                                  offset: Offset(0, 2),
                                  spreadRadius: 0)
                            ],
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  date ?? DateTime.now().toString(),
                  style: regular.copyWith(fontSize: 10, color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                if (replies != null)
                  SizedBox(
                    height: 5,
                  ),
                if (replies != null)
                  for (var reply in replies) reply
              ],
            ),
    );
  }
}
