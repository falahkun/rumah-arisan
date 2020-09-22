part of 'pages.dart';

class MessagesPage extends StatefulWidget {
  final String memberToken;

  const MessagesPage({Key key, this.memberToken}) : super(key: key);
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    context.bloc<ChatsBloc>().add(FetchChat(widget.memberToken));
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            TopBar(
              onTap: () {
                Navigator.pop(context);
              },
              title: "Messages",
            ),
            SizedBox(height: 25),
            BlocBuilder<ChatsBloc, ChatsState>(
                builder: (_, state) => (state is OnLoadedChats)
                    ? (state.messagesResult.status)
                        ? Column(
                            children: List.generate(
                            state.messagesResult.data.length,
                            (index) => GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.chatPage,
                                    arguments: ChatPageArguments(
                                        id: state.messagesResult.data[index].id,
                                        memberToken: widget.memberToken,
                                        token: state
                                            .messagesResult.data[index].token));
                              },
                              child: MessageItem(
                                lastMessage:
                                    state.messagesResult.data[index].lastChat ==
                                            null
                                        ? "No message available"
                                        : state.messagesResult.data[index]
                                                    .lastChat.teks.length >
                                                35
                                            ? state.messagesResult.data[index]
                                                    .lastChat.teks
                                                    .substring(0, 35) +
                                                "..."
                                            : state.messagesResult.data[index]
                                                .lastChat.teks,
                                name: state.messagesResult.data[index].nama,
                                imageProfile:
                                    state.messagesResult.data[index].foto,
                              ),
                            ),
                          ))
                        : Container(
                            height: (MediaQuery.of(context).size.height - 69)
                                .toDouble(),
                            child: Center(
                                child: Text(state.messagesResult.message)),
                          )
                    : Container(
                        height: (MediaQuery.of(context).size.height - 69)
                            .toDouble(),
                        child: Center(child: CircularProgressIndicator()),
                      ))
          ],
        ),
      ),
    );
  }
}
