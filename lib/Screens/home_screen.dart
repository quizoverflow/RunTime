import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:runtime/running_screen.dart';
import '../others/app_theme_data.dart';
import '../user_data.dart';

class HomeScreen extends StatefulWidget {
  final UserData userData;
  const HomeScreen({super.key, required this.userData});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      color: Colors.white60,
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("사용자 이름",style:
            TextStyle(color: Colors.black),),
          Text(widget.userData.username,style:
            TextStyle(color: Colors.cyan),),
          SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  AppThemeData().createPageRoute(RunningScreen()),
                );
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                fixedSize: const Size(170,44),
                shape:  const StadiumBorder(),
              ),
              child: const Text ("운동 시작"))
        ],
      )
    );
  }
}
