part of 'pages.dart';

class ChatPage extends StatefulWidget {
  final String memberToken;
  final String id;
  final String token;

  const ChatPage({Key key, this.memberToken, this.id, this.token})
      : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _controller = TextEditingController();
  @override
  initState() {
    super.initState();
    PusherServices.subscribe("message", () async {
      context.bloc<MessageBloc>().add(
          FetchMessage(memberToken: widget.memberToken, token: widget.token));
      setState(() {});
    }, "chat");
  }

  @override
  Widget build(BuildContext context) {
    context.bloc<MessageBloc>().add(
        FetchMessage(memberToken: widget.memberToken, token: widget.token));

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                _buildTopBar(
                  context,
                  "Watanabe Kazumi",
                  placeHolderImageUrl("Watanabe Kazumi"),
                  onTap: () {
                    context.bloc<MessageBloc>().add(RemoveAction());
                    Navigator.pop(context);
                  },
                ),
                BlocBuilder<MessageBloc, MessageState>(
                  builder: (_, state) => (state is OnLoadedMessage)
                      ? (state.chatResult.status)
                          ? Column(
                              children: List.generate(
                                  state.chatResult.data.length, (index) {
                                print(state.chatResult.status);
                                return Padding(
                                  padding:
                                      state.chatResult.data[index].nama == "-"
                                          ? EdgeInsets.only()
                                          : state.chatResult.data[index].reply
                                              ? EdgeInsets.only(
                                                  left: 20,
                                                  right: (MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2) -
                                                      0)
                                              : EdgeInsets.only(
                                                  right: 20,
                                                  left: (MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2) -
                                                      0),
                                  child: Row(
                                    mainAxisAlignment:
                                        state.chatResult.data[index].nama == "-"
                                            ? MainAxisAlignment.center
                                            : state.chatResult.data[index].reply
                                                ? MainAxisAlignment.start
                                                : MainAxisAlignment.end,
                                    children: [
                                      _buildChatBubble(
                                          state.chatResult.data[index].teks,
                                          "$index$index:$index$index",
                                          state.chatResult.data[index].nama ==
                                                  "-"
                                              ? BubbleChatType.ITS_TIME
                                              : state.chatResult.data[index]
                                                      .reply
                                                  ? BubbleChatType.ITS_NOT_ME
                                                  : BubbleChatType.ITS_ME)
                                    ],
                                  ),
                                );
                              }),
                            )
                          : Container(
                              color: Colors.red,
                            )
                      : Container(color: Colors.green),
                ),
                SizedBox(height: 65)
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 13, top: 13, left: 15),
                child: Row(
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
                              contentPadding:
                                  EdgeInsets.only(left: 10, bottom: 10),
                              hintStyle: regular.copyWith(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.45)),
                              hintText: "Ketikkan Sesuatu..."),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFC4C4C4).withOpacity(0.25),
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                    GestureDetector(
                      onTap: () async {
                        if (_controller.text == "") {
                        } else {
                          ChatServices.sendChat(widget.memberToken,
                              token: widget.token,
                              id: widget.id,
                              text: _controller.text,
                              foto: "");

                          _controller.text = "";
                          setState(() {});
                        }
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 24),
                  ],
                ),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
      ),
    );
  }

  Widget _buildTopBar(context, String name, String imageProfile,
      {Function onTap}) {
    return Container(
      height: 69,
      // color: Colors.blue,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
              top: 27,
              left: 20,
              child: GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset("assets/icons/back_arrow.svg"))),
          Align(
            alignment: Alignment.center,
            child: Text(
                name.replaceAll(
                  " ",
                  "\n",
                ),
                textAlign: TextAlign.center,
                style: regular.copyWith(fontSize: 18)),
          ),
          Positioned(
              top: 27,
              right: 20,
              child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: ClipPath.shape(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      child:
                          Image.network(imageProfile, height: 26, width: 26)))),
        ],
      ),
    );
  }

  _buildChatBubble(String message, String time, BubbleChatType chatType) {
    if (chatType == BubbleChatType.ITS_TIME) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          alignment: Alignment.center,
          height: 35,
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
          child: Text(
            message,
            style: bold.copyWith(fontSize: 12),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFF2C98F0).withOpacity(0.25),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 2),
                    spreadRadius: 0),
              ]),
        ),
      );
    } else {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            padding: EdgeInsets.only(
              top: 5,
              left: (chatType == BubbleChatType.ITS_NOT_ME) ? 5 : 10,
              right: (chatType == BubbleChatType.ITS_NOT_ME) ? 10 : 5,
              bottom: 5,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: (chatType == BubbleChatType.ITS_NOT_ME)
                    ? Colors.white
                    : Color(0xFF2C98F0),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, 2),
                      spreadRadius: 0),
                ]),
            child: Text(message,
                textAlign: chatType == BubbleChatType.ITS_TIME
                    ? TextAlign.center
                    : TextAlign.start,
                style: regular.copyWith(
                    fontSize: 14,
                    color: (chatType == BubbleChatType.ITS_NOT_ME)
                        ? Colors.black
                        : Colors.white)),
          ),
        ),
      );
    }
  }
}

enum BubbleChatType { ITS_TIME, ITS_ME, ITS_NOT_ME }
