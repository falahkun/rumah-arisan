part of 'widgets.dart';

class NotifItem extends StatelessWidget {
  final String date;
  final String title;
  final String description;
  final bool readed;
  final String image;

  const NotifItem(
      {Key key,
      this.date,
      this.title,
      this.description,
      this.readed,
      this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Container(
          padding: EdgeInsets.all(10),
          width: (MediaQuery.of(context).size.width),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/icons/Light/Document.svg",
                    color: readed ? Colors.grey : Colors.blue,
                    height: 15.58,
                    width: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Info ・$date", style: regular.copyWith(fontSize: 9)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text(
                    title ?? "Hello, this is My Dummy Notification",
                    style: bold.copyWith(
                      fontSize: 13,
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(right: 10, top: 5),
                  child: Text(
                    description ?? "Hello, this is My Dummy Notification",
                    style: regular.copyWith(fontSize: 12, color: Colors.grey),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
