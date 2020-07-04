import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainngtaskcalcapp/screens/home_screen_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenModel>(
      create: (context)=>HomeScreenModel(),
      child: Consumer<HomeScreenModel>(
        builder: (context, model,child) {
          return Scaffold(
            body:model.pageList[model.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: model.currentIndex,
                onTap: (int index){
                  model.currentIndex=index;
                },
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.book), title: Text('トーレーニングタスク')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.title), title: Text('ボリューム計算')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.change_history), title: Text('Big3変化')),
                ]),
          );
        }
      ),
    );
  }
}
