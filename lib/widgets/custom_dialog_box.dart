import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icoderz_task/models/entry.dart';
import 'package:icoderz_task/widgets/custom_button.dart';
import 'package:icoderz_task/widgets/custom_text_form_field.dart';

import '../controllers/entry_controller.dart';

class CustomDialogBox extends StatefulWidget {
  const CustomDialogBox({super.key});

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  final entryController = Get.find<EntryController>();
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _selectedItem = "Earning";
  final List<String> _dropdownItems = ["Earning","Expenses"];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomTextFormField(
                  keyboardType: TextInputType.number,
                  controller: amountController,
                  hintText: "Enter your amount",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomTextFormField(
                  controller: descriptionController,
                  hintText: "Enter Description",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: DropdownButton<String>(
                  hint: const Text('Select an item'),
                  value: _selectedItem,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue.toString();
                    });
                  },
                  items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    margin: const EdgeInsets.only(right: 10),
                    bgColor: Colors.redAccent,
                    onPressed: () {
                      Get.back();
                    },
                    childWidget: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),CustomButton(
                    bgColor: Colors.blue,
                    onPressed: () {
                      final isValid = _formKey.currentState?.validate();
                      if (isValid != true) {
                        return;
                      } else {
                        entryController.addEntry(
                          Entry(
                            id: DateTime.now().toString(),
                            amount: int.parse(amountController.text),
                            type: _selectedItem,
                            description: descriptionController.text,
                            time: DateTime.now(),
                          ),
                        );
                        Get.back();
                      }
                    },
                    childWidget: const Text(
                      "Add Entry",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
