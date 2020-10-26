part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  final String memberToken;
  final DataResultToken user;

  const ProfilePage({Key key, this.memberToken, this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _oldPassword = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _cNewPassword = TextEditingController();

  bool _isEditing = false;

  @override
  initState() {
    super.initState();

    setState(() {
      _name = TextEditingController(text: widget.user.nama);
      _email = TextEditingController(text: widget.user.email);
      _phoneNumber = TextEditingController(text: widget.user.telepon);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            TopBar(
                onTap: () {
                  Navigator.pop(context);
                },
                title: "My\nProfile"),
            SizedBox(height: 10),
            Column(
              children: [
                Image.asset(
                  "assets/images/profile_unfilled.png",
                  height: 85,
                  width: 85,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 26),
                buildTextField(_name,
                    labelText: "Your Name", enable: _isEditing),
                buildTextField(_email,
                    labelText: "Your Email", enable: _isEditing),
                buildTextField(_phoneNumber,
                    labelText: "Your Phone Number", enable: _isEditing),
                if (_isEditing)
                  buildTextField(_oldPassword,
                      labelText: "Old Password",
                      helperText: "fill if you want to change password",
                      enable: true),
                if (_isEditing)
                  buildTextField(_newPassword,
                      labelText: "New Password",
                      helperText: "fill if you want to change password",
                      enable: true),
                if (_isEditing)
                  buildTextField(_cNewPassword,
                      labelText: "Confirm New Password",
                      helperText: "fill if you want to change password",
                      enable: true),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isEditing = !_isEditing;
                    });
                  },
                  child: Container(
                    height: 45,
                    width: 240,
                    child: Center(
                        child: Text("Edit",
                            style: regular.copyWith(
                                fontSize: 13, color: Colors.white))),
                    decoration: BoxDecoration(
                      color: Color(0xFF2C98F0),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller,
      {String labelText, String helperText, bool enable = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: TextField(
        controller: controller,
        style: regular.copyWith(fontSize: 14),
        enabled: enable,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: regular.copyWith(
              fontSize: 14,
            ),
            helperText: helperText,
            helperStyle: regular.copyWith(fontSize: 11)),
      ),
    );
  }
}
