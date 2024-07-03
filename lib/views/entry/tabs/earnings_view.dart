import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icoderz_task/widgets/custom_edit_dialog_box.dart';
import 'package:intl/intl.dart';

import '../../../controllers/entry_controller.dart';

class EarningsView extends StatefulWidget {
  const EarningsView({super.key});

  @override
  State<EarningsView> createState() => _EarningsViewState();
}

class _EarningsViewState extends State<EarningsView> {

  final entryController = Get.find<EntryController>();
  DateFormat dateFormat = DateFormat('dd-MM-yyyy h:mm a');

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Colors.grey,
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: entryController.earningEntryList.length,
          itemBuilder: (context, index) {
            final entryItem = entryController.earningEntryList[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    "${entryItem.amount.toString()} ₹",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                title: Text(entryItem.description),
                subtitle: Text(dateFormat.format(entryItem.time)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomEditDialogBox(entryItem: entryItem,),
                          );
                        },
                        child: const Icon(
                          Icons.edit_rounded,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        entryController.deleteEntry(entryItem,index);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
