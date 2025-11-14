import 'package:bloc_mimarisi/seviye3/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class UserRepo {
  var db = Hive.box<UserModel>('dbuser');

  List<UserModel> allUsers = [];

  //Veri kaydet

  Future<void> saveUser(String userName, String userNumber) async {
    var userID = Uuid().v1();
    var newUser = UserModel(
      userId: userID,
      userName: userName,
      userNumber: userNumber,
    );
    await db.put(userID, newUser);
  }

  //Veri Çek
  Future<List<UserModel>> getUsers() async {
    if (db.isNotEmpty) {
      allUsers = db.values.toList();
      return allUsers;
    } else {
      return allUsers;
    }
  }
  //Veri Güncelle
  Future<void> updateUser(UserModel usermodel) async{
    await db.put(usermodel.userId, usermodel);
  }

  // Veri Sil
  Future<void> deleteUser(UserModel usermodel) async{
    await db.delete(usermodel.userId);
  }

}
