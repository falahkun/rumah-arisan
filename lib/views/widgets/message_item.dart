part of 'widgets.dart';

class MessageItem extends StatelessWidget {
  final String imageProfile;
  final String name;
  final String lastMessage;

  const MessageItem({Key key, this.imageProfile, this.name, this.lastMessage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        bottom: 14,
        right: 20,
      ),
      child: Container(
        height: 70,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipPath.shape(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.network(
                      imageProfile ?? placeHolderImageUrl(name),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name.toString(),
                      style:
                          regular.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    Text(lastMessage ?? "",
                        style: regular.copyWith(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.65))),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
