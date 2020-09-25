part of 'pages.dart';

class MyCloter extends StatefulWidget {
  final String memberToken;

  const MyCloter({Key key, this.memberToken}) : super(key: key);
  @override
  _MyCloterState createState() => _MyCloterState();
}

class _MyCloterState extends State<MyCloter> {
  @override
  Widget build(BuildContext context) {
    context.bloc<MOCBloc>().add(FetchMOC(widget.memberToken));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.createCloter,
              arguments: CreateCloterArguments(
                memberToken: widget.memberToken,
              ));
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          TopBar(
            onTap: () {
              Navigator.pop(context);
              context.bloc<MOCBloc>().add(RemoveMOC());
            },
            title: "Arisan\nSaya",
          ),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<MOCBloc, MOCState>(
            builder: (_, state) => (state is OnLoadedMOC)
                ? (state.cloter.status)
                    ? Column(
                        children:
                            List.generate(state.cloter.data.length, (index) {
                        var item = state.cloter.data[index];
                        print(state.cloter.data.length);
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.createCloter,
                                arguments: CreateCloterArguments(
                                  cloter: item,
                                  memberToken: widget.memberToken,
                                ));
                          },
                          child: ArisanHorizontalItem(
                            imageUrl: item.foto,
                            installments: item.angsuran,
                            joinedMember: item.anggota,
                            quota: item.kuota,
                            title: item.nama,
                          ),
                        );
                      }))
                    : MError(
                        message: state.cloter.message,
                      )
                : Center(child: CircularProgressIndicator()),
          )
        ],
      )),
    );
  }
}
