part of 'pages.dart';

class CommunityDiscussPage extends StatefulWidget {
  final String slug;
  final String memberToken;

  const CommunityDiscussPage({Key key, this.slug, this.memberToken})
      : super(key: key);
  @override
  _CommunityDiscussPageState createState() => _CommunityDiscussPageState();
}

class _CommunityDiscussPageState extends State<CommunityDiscussPage> {
  TextEditingController _controller = TextEditingController();
  Map<String, dynamic> _repliedTo = {};
  @override
  Widget build(BuildContext context) {
    context
        .bloc<ComDiscussBloc>()
        .add(FetchComDiscuss(widget.slug, widget.memberToken));
    return WillPopScope(
      onWillPop: () async {
        context.bloc<ComDiscussBloc>().add(null);
        return false;
      },
      child: Scaffold(
        body: BlocBuilder<ComDiscussBloc, ComDiscussState>(
          builder: (_, state) => (state is OnLoadedComDiscuss)
              ? SafeArea(
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 27,
                                    left: 20,
                                    bottom: (14 + 27).toDouble()),
                                child: GestureDetector(
                                    onTap: () {
                                      context.bloc<ComDiscussBloc>().add(null);
                                      Navigator.pop(context);
                                    },
                                    child: SvgPicture.asset(
                                        "assets/icons/back_arrow.svg")),
                              ),
                            ],
                          ),
                          Column(
                            children: List.generate(state.discuss.data.length,
                                (index) {
                              state.discuss.data
                                  .sort((a, b) => a.date.compareTo(b.date));
                              return DiscussBubble(
                                onTap: () {
                                  setState(() {
                                    _repliedTo = {
                                      "name": state.discuss.data[index].nama,
                                      "id": state.discuss.data[index].id
                                    };
                                  });
                                },
                                date: state.discuss.data[index].date,
                                imageProfile: state.discuss.data[index].foto,
                                name: state.discuss.data[index].nama,
                                text: state.discuss.data[index].teks.trim(),
                                replies: List.generate(
                                    state.discuss.data[index].reply.length,
                                    (replyIndex) {
                                  state.discuss.data[index].reply
                                      .sort((a, b) => a.date.compareTo(b.date));
                                  return DiscussBubble(
                                    isReply: true,
                                    name: state.discuss.data[index]
                                        .reply[replyIndex].nama,
                                    date: state.discuss.data[index]
                                        .reply[replyIndex].date,
                                    text: state.discuss.data[index]
                                        .reply[replyIndex].teks
                                        .trim(),
                                    imageProfile: state.discuss.data[index]
                                        .reply[replyIndex].foto,
                                  );
                                }),
                              );
                            }),
                          ),
                          SizedBox(height: 60),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          height: _repliedTo.isNotEmpty ? 90 : 60,
                          width: double.infinity,
                          padding:
                              EdgeInsets.only(bottom: 13, top: 13, left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (_repliedTo.isNotEmpty)
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Reply To ${_repliedTo['name']}",
                                          style: bold.copyWith(fontSize: 13)),
                                      Padding(
                                        padding: EdgeInsets.only(right: 15),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _repliedTo = {};
                                            });
                                          },
                                          child: Icon(Icons.close, size: 15),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 34,
                                      width: double.infinity,
                                      child: TextField(
                                        style: regular.copyWith(
                                          fontSize: 12,
                                        ),
                                        controller: _controller,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 10, bottom: 10),
                                            hintStyle: regular.copyWith(
                                                fontSize: 12,
                                                color: Colors.black
                                                    .withOpacity(0.45)),
                                            hintText: "Ketikkan Sesuatu..."),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color:
                                            Color(0xFFC4C4C4).withOpacity(0.25),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 24),
                                  GestureDetector(
                                    onTap: () async {
                                      CommunityServices.postComment(
                                              widget.slug, _controller.text,
                                              memberToken: widget.memberToken,
                                              discussId: (_repliedTo.isNotEmpty)
                                                  ? _repliedTo['id']
                                                  : null)
                                          .then((value) {
                                        if (value.status) {
                                        } else {
                                          Flushbar(
                                            duration: Duration(seconds: 2),
                                            flushbarPosition:
                                                FlushbarPosition.TOP,
                                            messageText: Text(value.message,
                                                style: regular.copyWith(
                                                    color: Colors.white)),
                                          )..show(context);
                                        }
                                      });
                                      setState(() {
                                        _repliedTo = {};
                                        _controller.text = "";
                                      });

                                      await Future.delayed(
                                          Duration(seconds: 2));
                                      context.bloc<ComDiscussBloc>().add(
                                          FetchComDiscuss(
                                              widget.slug, widget.memberToken));
                                    },
                                    child: Icon(
                                      Icons.send,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  SizedBox(width: 24),
                                ],
                              ),
                            ],
                          ),
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                                blurRadius: 3,
                                color: Colors.black.withOpacity(0.25),
                                offset: Offset(0, -1),
                                spreadRadius: 0),
                          ]),
                        ),
                      )
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
