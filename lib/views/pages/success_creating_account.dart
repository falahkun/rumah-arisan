part of 'pages.dart';

class SuccessCreatingAccountPage extends StatefulWidget {
  final bool isRegister;
  final String message;

  const SuccessCreatingAccountPage({Key key, this.isRegister, this.message})
      : super(key: key);
  @override
  _SuccessCreatingAccountPageState createState() =>
      _SuccessCreatingAccountPageState();
}

class _SuccessCreatingAccountPageState
    extends State<SuccessCreatingAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(
                flex: 1,
              ),
              Text(
                (widget.message != null)
                    ? widget.message
                    : (widget.isRegister)
                        ? "Yeay! Akunmu\nUdah berhasil dibuat"
                        : "Yeay! Akunmu\nUdah Berhasil diverifikasi",
                style: bold.copyWith(fontSize: 23),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              if (widget.message == null)
                Text(
                  (widget.isRegister)
                      ? "Yuk cek inbox email kamu, \nAktivasi segera akunmu!\nbiar bisa jadi member kita"
                      : "Yuk Login ke aplikasi, \nbakalan banyak cerita antara kamu \ndan kita ",
                  style: regular.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              Spacer(
                flex: 2,
              ),
              if (widget.message == null)
                Text(
                  "tungguin ya...",
                  style: regular.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  context.bloc<PageBloc>().add(GoToSignInPage());
                },
                child: Container(
                  height: 45,
                  width: 290,
                  decoration: BoxDecoration(
                    color: Color(0xFFFD6585),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style:
                          regular.copyWith(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
