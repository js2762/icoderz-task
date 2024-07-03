
import 'package:get/get.dart';
import 'package:icoderz_task/models/entry.dart';
import 'package:icoderz_task/services/storage%20services/storage_services.dart';

class EntryController extends GetxController {
  RxList<Entry> earningEntryList = <Entry>[].obs;
  RxList<Entry> expensesEntryList = <Entry>[].obs;
  final storageServiceController = Get.find<StorageServices>();
  RxInt currentBalance = 0.obs;

  getAllListData() {
    earningEntryList.clear();
    expensesEntryList.clear();
    earningEntryList.value = storageServiceController.earningEntryBox.values.toList();
    expensesEntryList.value = storageServiceController.expensesEntryBox.values.toList();
    calculateCurrentBalance();
  }

  calculateCurrentBalance(){
    int totalEarning = 0;
    int totalExpenses = 0;
    for (var element in earningEntryList) {
      totalEarning = totalEarning + element.amount;
    }
    for (var element in expensesEntryList) {
      totalExpenses = totalExpenses + element.amount;
    }
    currentBalance.value = totalEarning - totalExpenses;
  }
  addEntry(Entry item) {
    if (item.type == "Earning") {
      earningEntryList.add(item);
      storageServiceController.earningEntryBox.add(item);
    } else {
      expensesEntryList.add(item);
      storageServiceController.expensesEntryBox.add(item);
    }
  }

  deleteEntry(Entry item, int index) {
    if (item.type == "Earning") {
      earningEntryList.removeWhere((element) => element.id == item.id);
      print(earningEntryList.length);
      storageServiceController.earningEntryBox.deleteAt(index);
      print(323232);
    } else {
      expensesEntryList.removeWhere((element) => element.id == item.id);
      print(expensesEntryList.length);
      storageServiceController.expensesEntryBox.deleteAt(index);
      print(373737);
    }
  }

  updateEntryData(Entry updatedItem) {
    if (updatedItem.type == "Earning") {
      final itemIndex = earningEntryList.indexWhere((element) => element.id == updatedItem.id);
      earningEntryList[itemIndex] = updatedItem;
      storageServiceController.earningEntryBox.putAt(itemIndex, updatedItem);
    } else {
      final itemIndex = expensesEntryList.indexWhere((element) => element.id == updatedItem.id);
      expensesEntryList[itemIndex] = updatedItem;
      storageServiceController.expensesEntryBox.putAt(itemIndex, updatedItem);

    }
  }
}
