import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:runtime/Screens/home_screen.dart';
import 'package:runtime/others/app_theme_data.dart';
import 'package:runtime/user_data.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  String? username = "사용자";
  late UserData userData;

  Future<void> _loadUserData() async {
    //나중에 여기서 데이터 로딩 로직 구현
    userData = UserData();
    //스플래시 디버깅용 지연시간 2초 추가
    await Future.delayed(Duration(seconds: AppThemeData().debugTime));
  }

  @override
  void initState() {
    _loadUserData().then((_) {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => HomeScreen(userData: userData,)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                width: 300,
                height: 300,
                child: SvgPicture.asset('asset/debug_img/Dsplash.svg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(
                "Run Time",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                ),
              ),
              const SizedBox(height: 40),
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          )
        ],
      ),

    );
  }
}
