part of 'pages.dart';

class MyCommunitiesPage extends StatefulWidget {
  final String memberToken;

  const MyCommunitiesPage({Key key, this.memberToken}) : super(key: key);
  @override
  _MyCommunitiesPageState createState() => _MyCommunitiesPageState();
}

class _MyCommunitiesPageState extends State<MyCommunitiesPage> {
  @override
  Widget build(BuildContext context) {
    context.bloc<MCBloc>().add(FetchMCommunities(widget.memberToken));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.createCommunity,
              arguments:
                  CreateCommunityArguments(memberToken: widget.memberToken));
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            TopBar(
              title: "Communities",
              onTap: () {
                context.bloc<MCBloc>().add(RemoveEventMC());
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 15),
            BlocBuilder<MCBloc, MCommunitiesState>(
              builder: (_, state) => (state is OnLoadedMCommunities)
                  ? Column(
                      children:
                          List.generate(state.results.data.length, (index) {
                      print(state.results.data.length);
                      var item = state.results.data[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 15.0,
                        ),
                        child: CommunityItem(
                          title: item.nama,
                          urlImage: item.foto ?? placeHolderImageUrl(item.nama),
                          isLiked: index.isEven ? true : false,
                          liked: (index + 1) * 100,
                          privacy: !item.private ? "Public" : "Private",
                          rating: 2,
                          reactedPeople: 2,
                        ),
                      );
                    }))
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
