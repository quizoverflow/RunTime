
import 'package:shared_preferences/shared_preferences.dart';

class UserData{
  // 사용자 데이터 : 이름, 기록 관리, 걸음 합계
  late String username;
  late List<String> record;
  late int total;

  // create sharedpreference instance
  late SharedPreferences prefs;

  // 생성자
  UserData(){
    _loadData();
  }

  Future _loadData() async{
    //load and set userdata
    prefs = await SharedPreferences.getInstance();

    username = prefs.getString('username')?? '사용자';
    record = prefs.getStringList('record')?? [];
    total = 0;
    for(int i = 0; i < record.length; ++i){
      total += int.parse(record[i]);
    }
  }

  Future _updateName(String newName) async{
    prefs.setString('username', newName);
  }

  Future _updateRecord(int newRecord) async{
    record.add(newRecord.toString());
    total += newRecord;
    prefs.setStringList('record', record);
  }

}