import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainngtaskcalcapp/parts/config.dart';
import 'package:trainngtaskcalcapp/parts/login_button.dart';
import 'package:trainngtaskcalcapp/signin/sigin_in_model.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInModel>(
      create: (context) => SignInModel(),
      child: Scaffold(
          body: Consumer<SignInModel>(builder: (context, model, child) {
        return SingleChildScrollView(
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
                        model.title,
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
                        controller: passController,
                        onChanged: (text) {
                          model.pass = text;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'passを入力してください',
                          labelText: 'pass',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    LogInButton(
                        colorFirst: primaryColor,
                        colorSecond: secondaryColor,
                        text: '登録する',
                        onTap: () async {
                          //todo
                          try {
                            await model.signIn();
                            _showDialog(context, '登録が完了しました');
                          } catch (e) {
                            _showDialog(context, e.toString());
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
        );
      })),
    );
  }

  Future _showDialog(BuildContext context, String title) async {
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
                  child: Text('戻る'))
            ],
          );
        });
  }
}
