import 'package:hive/hive.dart';
part 'userdata.g.dart';

@HiveType(typeId: 0)
class UserData extends HiveObject {

  @HiveField(0)
  String idToken;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String email;

  @HiveField(3)
  String? profileImage;


  UserData({
    required this.idToken,
    this.name,
    required this.email,
    this.profileImage,
  });
}
