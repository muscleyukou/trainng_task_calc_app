import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trainngtaskcalcapp/logIn/log_in_model.dart';
import 'package:trainngtaskcalcapp/parts/config.dart';
import 'package:trainngtaskcalcapp/parts/login_button.dart';
import 'package:trainngtaskcalcapp/screens/home_screen.dart';
import 'package:trainngtaskcalcapp/signin/sigin_page.dart';

class LogInScreen extends StatelessWidget {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LogInModel>(
      create: (context) => LogInModel(),
      child: Consumer<LogInModel>(builder: (context, model, child) {
        return Scaffold(
            body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Container(
                      child: Image(
                        image: AssetImage('assets/image/dumbbell.png'),
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Container(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'emailを入力してください',
                          labelText: 'email',
                        ),
                        controller: mailController,
                        onChanged: (text) {
                          model.mail = text;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'passを入力してください',
                          labelText: 'pass',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (text) {
                          model.pass = text;
                        },
                        obscureText: true,
                      ),
                    ),
                    LogInButton(
                      colorFirst: primaryColor,
                      colorSecond: secondaryColor,
                      text: 'LogIn',
                      onTap: () async {
                        //todo
                        try {
                          await model.logIn();
                          _showDialogFirst(context, 'ログインに成功しました');
                        } catch (e) {
                          _showDialogSecond(context, e.toString());
                        }
                      },
                    ),
                    LogInButton(
                      colorFirst: Colors.blueAccent,
                      colorSecond: Colors.deepOrangeAccent,
                      text: 'SignIn Using Email',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                      },
                    ),
                    FlatButton.icon(
                      icon: FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.redAccent,
                      ),
                      label: Text('Sign in Using Gmail '),
                      onPressed: ()async {
                        try {
                          await model.signInGoogle();
                          _showDialogFirst(context, 'ログインに成功しました');
                          print('成功しました');
                        } catch (e) {
                          _showDialogSecond(context, e.toString());
                        }
                      },
                    ),

                  ],
                ),
              ),
            ),
          ),
        ));
      }),
    );
  }

  Future _showDialogFirst(BuildContext context, String title) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title.toString()),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text('次へ')),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('戻る')),
            ],
          );
        });
  }

  Future _showDialogSecond(BuildContext context, String title) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title.toString()),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('戻る')),
            ],
          );
        });
  }
}
