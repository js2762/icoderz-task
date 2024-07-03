import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icoderz_task/controllers/entry_controller.dart';
import 'package:icoderz_task/models/entry.dart';

import 'custom_button.dart';
import 'custom_text_form_field.dart';

class CustomEditDialogBox extends StatefulWidget {
  final Entry entryItem;

  const CustomEditDialogBox({
    super.key,
    required this.entryItem,
  });

  @override
  State<CustomEditDialogBox> createState() => _CustomEditDialogBoxState();
}

class _CustomEditDialogBoxState extends State<CustomEditDialogBox> {
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  final entryController = Get.find<EntryController>();

  @override
  void initState() {
    // TODO: implement initState
    amountController.text = widget.entryItem.amount.toString();
    descriptionController.text = widget.entryItem.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Amount",
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomTextFormField(
                controller: amountController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomTextFormField(
                controller: descriptionController,
              ),
            ),
            CustomButton(
              onPressed: () {
                entryController.updateEntryData(
                  Entry(
                    id: widget.entryItem.id,
                    amount: int.parse(amountController.text),
                    type: widget.entryItem.type,
                    description: descriptionController.text,
                    time: widget.entryItem.time,
                  ),
                );
                Get.back();
              },
              bgColor: Colors.blue,
              childWidget: const Text(
                "UPDATE",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
