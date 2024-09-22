import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectDate = DateTime.now();

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Add Expenses",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  // color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: expenseController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(
                        FontAwesomeIcons.dollarSign,
                        size: 16,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: categoryController,
                  textAlignVertical: TextAlignVertical.center,
                  onTap: () {},
                  readOnly: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(255, 255, 255, 1),
                      prefixIcon: const Icon(
                        FontAwesomeIcons.list,
                        size: 16,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                bool isExpanded = false;
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      title: const Text("Add category"),
                                      backgroundColor: Colors
                                          .lightBlue[100], // Sky blue color
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            // controller: expenseController,
                                            decoration: InputDecoration(
                                                isDense: true,
                                                filled: true,
                                                fillColor: Colors.white,
                                                hintText: "Name",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    borderSide:
                                                        BorderSide.none)),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          TextFormField(
                                              onTap: () {
                                                setState(() {
                                                  isExpanded = !isExpanded;
                                                });
                                              },
                                              readOnly: true,
                                              // controller: expenseController,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                filled: true,
                                                fillColor: Colors.white,
                                                suffixIcon: Icon(
                                                  CupertinoIcons.chevron_down,
                                                  size: 12,
                                                ),
                                                hintText: "Icon",
                                                border: OutlineInputBorder(
                                                    borderRadius: isExpanded
                                                        ? const BorderRadius
                                                            .vertical(
                                                            top:
                                                                Radius.circular(
                                                                    12))
                                                        : BorderRadius.circular(
                                                            12),
                                                    borderSide:
                                                        BorderSide.none),
                                              )),
                                          isExpanded
                                              ? Container(
                                                  width: double.infinity,
                                                  height: 200,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                      bottom:
                                                          Radius.circular(12),
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          TextFormField(
                                            // controller: expenseController,
                                            decoration: InputDecoration(
                                                isDense: true,
                                                filled: true,
                                                fillColor: Colors.white,
                                                hintText: "Color",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    borderSide:
                                                        BorderSide.none)),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              });
                        },
                        icon: const Icon(
                          FontAwesomeIcons.plus,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ),
                      hintText: "Category",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: dateController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: selectDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );

                    if (newDate != null) {
                      setState(() {
                        dateController.text =
                            DateFormat('dd/MM/yyyy').format(newDate);
                        selectDate = newDate;
                      });
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(
                        FontAwesomeIcons.clock,
                        size: 16,
                        color: Colors.grey,
                      ),
                      hintText: "Date",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                  onPressed: () {},
                  child: SizedBox(
                      width: double.infinity,
                      height: kToolbarHeight,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        child: const Text(
                          "Save",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
