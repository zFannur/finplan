import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final List<String> listCategories;
  final TextEditingController controller;
  final String? Function(String? value) validator;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.listCategories,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hintText,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: labelText,
            ),
            onTap: () {
              _showBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.only(top: 60),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Назад'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.text.isNotEmpty) {
                          context.popRoute();
                        }
                      },
                      child: const Text('Добавить'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: labelText,
                  ),
                  onTap: () {
                    controller.text = '';
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Wrap(
                    children: List.generate(
                      listCategories.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue.shade50)),
                            onPressed: () {
                              controller.text = listCategories[index];
                              context.popRoute();
                            },
                            child: Text(listCategories[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SumFieldWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String? value) validator;

  const SumFieldWidget({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hintText,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: labelText,
            ),
          ),
        ],
      ),
    );
  }
}

class DataFieldWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String? value) validator;

  const DataFieldWidget({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  Future<DateTime> selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != selectedDate) {
      selectedDate = selected;
    }
    return selectedDate.copyWith(hour: 12, minute: 12, second: 12);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hintText,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: labelText,
            ),
            onTap: () async {
              DateTime date = await selectDate(context);
              controller.text = date.toString();
            },
          ),
        ],
      ),
    );
  }
}
