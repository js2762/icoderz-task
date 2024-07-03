import 'package:get/get.dart';
import 'package:icoderz_task/models/userdata.dart';
import 'package:icoderz_task/services/storage%20services/storage_services.dart';

class ProfileController extends GetxController{

  UserData? user;
  final storageServiceController = Get.find<StorageServices>();


  initData() async {
    user = storageServiceController.authUserBox.get("userData");
  }

}