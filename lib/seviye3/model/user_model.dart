import 'package:hive/hive.dart';
part 'user_model.g.dart';


@HiveType(typeId: 1)
class UserModel{
  @HiveField(0)
  String userId;
  @HiveField(1)
  String userName;
  @HiveField(2)
  String userNumber;
  UserModel({required this.userId,required this.userName,required this.userNumber});

}





