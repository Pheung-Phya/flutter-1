import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/model/category.dart';
import 'package:shopping_list/model/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  

  final _keyForm = GlobalKey<FormState>();
  var _enterName = "";
  int _enterQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;

  void _AddItem() {
    if (_keyForm.currentState!.validate()) {
      _keyForm.currentState!.save();
      // Navigator.pop(context);
      Navigator.of(context).pop(
        GroceryItem(id: DateTime.now().toString(), name: _enterName, quantity: _enterQuantity, category: _selectedCategory)
      );
    }
  }

  void _Reset() {
    _keyForm.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Item"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
              key: _keyForm,
              child: Column(
                children: [
                  TextFormField(
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text('name'),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length <= 1 ||
                          value.trim().length >= 50) {
                        return "text must between 1 of 50";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      if (value == null) {
                        return;
                      }
                      _enterName = value;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Value'),
                          ),
                          initialValue: _enterQuantity.toString(),
                          validator: (value) {
                            if (value == null ||
                                int.tryParse(value) == null ||
                                int.parse(value) < 1) {
                              return "Enter a valid number greater than 0";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enterQuantity = int.parse(value!);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                            value: _selectedCategory,
                            items: [
                              for (final category in categories.entries)
                                DropdownMenuItem(
                                    value: category.value,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          color: category.value.color,
                                        ),
                                        Text(category.value.name)
                                      ],
                                    ))
                            ],
                            onChanged: (value) {
                              setState(() {
                                _selectedCategory = value!;
                              });
                            }),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            _Reset();
                          },
                          child: const Text('Reset')),
                      ElevatedButton(
                          onPressed: _AddItem, child: const Text('Add Item'))
                    ],
                  )
                ],
              ))),
    );
  }
}
