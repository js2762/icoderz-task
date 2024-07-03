import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:icoderz_task/models/userdata.dart';

import '../../models/entry.dart';

class StorageServices extends GetxController {

  late Box<Entry> earningEntryBox;
  late Box<Entry> expensesEntryBox;
  late Box<UserData> authUserBox;

  @override
  void onInit() {
    // TODO: implement onInit
    openBox();
    super.onInit();
  }

  openBox () async{
    earningEntryBox = await Hive.openBox<Entry>('earningEntryBox');
    expensesEntryBox = await Hive.openBox<Entry>('expensesEntryBox');
    authUserBox = await Hive.openBox('authUserBox');
  }

}