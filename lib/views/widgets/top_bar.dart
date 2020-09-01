part of 'widgets.dart';

class TopBar extends StatelessWidget {
  final String title;
  final String imageUrl;

  const TopBar({Key key, this.title, this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title ?? "Discover", style: bold.copyWith(
          fontSize: 23,
        ),),
        ClipPath.shape(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6)
          ),
          child: (imageUrl == null) ? Image.asset("assets/images/profile_unfilled.png", height: 35, width: 35, fit: BoxFit.cover,) : Image.network(imageUrl, width: 35, height: 35, fit: BoxFit.cover,))
      ],
    );
  }
}