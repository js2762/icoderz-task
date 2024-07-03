import 'package:get/get.dart';
import 'package:icoderz_task/services/api%20services/api_services.dart';
import 'package:icoderz_task/services/storage%20services/storage_services.dart';

void initAllServices() {
  Get.put(StorageServices(), permanent: true);
  Get.put(ApiServices(), permanent: true);
}
