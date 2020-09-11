part of 'pages.dart';

class CategoryFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 60),
          children: [
            Text(
              "Rumah Arisan",
              style: bold.copyWith(fontSize: 18, color: Color(0xFF1BA0E2)),
              textAlign: TextAlign.center,
            ),
            Text(
              "Temukan dan Lakukan Apa \nyang Kamu Suka",
              style: regular.copyWith(fontSize: 14, color: Color(0xFF1BA0E2)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 14,
            ),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (_, cState) => (cState is OnLoadedCategory)
                  ? (!cState.categoryResult.status)
                      ? Center(
                          child: Text(cState.categoryResult.message),
                        )
                      : StaggeredGridView.countBuilder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          itemCount: cState.categoryResult.data.length,
                          itemBuilder: (BuildContext context, int index) =>
                              new Container(
                                  height: 155,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF93A7B7),
                                          Colors.white.withOpacity(0.45),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [0.3, 1.91]),
                                  ),
                                  child: Stack(
                                    children: [
                                      if (((index + 1) % 3 != 0))
                                        Positioned(
                                          top: 12,
                                          left: 12,
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            height: 66,
                                            width: 66,
                                            child: cState.categoryResult.data[index].icon == null ? Image.asset(
                                                "assets/images/Check.png",
                                                height: 40,
                                                width: 40) : Image.network(
                                                cState.categoryResult.data[index].icon,
                                                height: 40,
                                                width: 40),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      if (((index + 1) % 3 != 0))
                                        Positioned(
                                            top: 98,
                                            left: 12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(cState.categoryResult.data[index].nama ?? "This is Title",
                                                    style: bold.copyWith(
                                                        fontSize: 16,
                                                        color: Colors.black)),
                                                Text("the subtitle not found",
                                                    style: regular.copyWith(
                                                        fontSize: 13,
                                                        color: Colors.black)),
                                              ],
                                            )),
                                      if (!((index + 1) % 3 != 0))
                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 42,
                                                ),
                                                Text(cState.categoryResult.data[index].nama ?? "This is Title",
                                                    style: bold.copyWith(
                                                        fontSize: 16,
                                                        color: Colors.black)),
                                                Text("the subtitle has found",
                                                    style: regular.copyWith(
                                                        fontSize: 13,
                                                        color: Colors.black)),
                                              ],
                                            )),
                                      if (!((index + 1) % 3 != 0))
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 32.0),
                                              child: Container(
                                                height: 27,
                                                width: 77,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          blurRadius: 4,
                                                          spreadRadius: 0,
                                                          offset: Offset(0, 4),
                                                          color: Colors.black
                                                              .withOpacity(0.4))
                                                    ]),
                                                child: Center(
                                                  child: Text("view all",
                                                      style: regular.copyWith(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xFF1BA0E2))),
                                                ),
                                              ),
                                            ))
                                    ],
                                  )),
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.fit(
                                  ((index + 1) % 3 != 0) ? 1 : 2),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10.0,
                        )
                  : Center(child: CircularProgressIndicator()),
            )
          ],
        ),
      ),
    );
  }
}
