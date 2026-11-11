import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
 
class NewItem extends StatefulWidget{
  const NewItem({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewItemState();
  }
}
 
class _NewItemState extends State<NewItem>{
  final _formKey = GlobalKey<FormState>();
 
  void _saveItem() {
    _formKey.currentState!.validate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new item'),
      ),
      body: Padding(padding: EdgeInsets.all(12),
      child: Form(
        child: Column(
        children: [
          TextFormField(
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Name'),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name must not be empty';
              }
              return null;
            },
          ),
 
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Quantity'),
                  ),
                  validator: (value) {
                    if (value == null ||
                        int.tryParse(value) == null ||
                        int.parse(value) <= 0) {
                      return 'Input must be number';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField(
                  value: categories.values.first,
                  items: [
                    for (final category in categories.values)
                      DropdownMenuItem(
                        value: category,
                        child: Row(
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              color: category.color,
                            ),
                            const SizedBox(width: 6),
                            Text(category.title),
                          ],
                        ),
                      ),
                  ],
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Reset'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: _saveItem,
                child: const Text('Add Item'),
              ),
            ],
          ),
        ],
      ),
      ),
       
    ),
    );
  }
}
 