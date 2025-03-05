import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/setup_expense.dart';
import '../bloc/setup_expense_bloc.dart';
import '../bloc/setup_expense_event.dart';

class EditExpensePage extends StatefulWidget {
  final SetupExpense expense;
  const EditExpensePage({super.key, required this.expense});

  @override
  _EditExpensePageState createState() => _EditExpensePageState();
}

class _EditExpensePageState extends State<EditExpensePage> {
  final _formKey = GlobalKey<FormState>();

  final List<String> _categoryOptions = [
    "نايلون",
    "ناموسيات",
    "صقيع",
    "تعقيم"
  ];

  final Map<String, List<String>> _expenseTypeMapping = {
    "نايلون": [
      "أجور يد عاملة",
      "ثمن نايلون",
      "ثمن خشب",
      "شريط صالات",
      "شريط تربيط",
      "أخرى"
    ],
    "ناموسيات": [
      "أجور يد عاملة",
      "ثمن ناموسيات",
      "شريط تربيط",
      "أخرى"
    ],
    "صقيع": [
      "أجور يد عاملة",
      "ثمن مواد",
      "أخرى"
    ],
    "تعقيم": [
      "أجور يد عاملة",
      "أخرى",
      "ثمن مواد"
    ],
  };

  String? _selectedCategory;
  String? _selectedExpenseType;
  final TextEditingController _costController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.expense.categoryType;
    if (_expenseTypeMapping.containsKey(_selectedCategory)) {
      List<String> expenseTypes = _expenseTypeMapping[_selectedCategory]!;
      if (expenseTypes.contains(widget.expense.expenseType)) {
        _selectedExpenseType = widget.expense.expenseType;
      } else {
        _selectedExpenseType = expenseTypes[0];
      }
    } else {
      _selectedExpenseType = null;
    }
    _costController.text = widget.expense.cost.toString();
    _selectedDate = widget.expense.date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تحرير المصروف'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: const InputDecoration(
                    labelText: 'نوع الفئة',
                    border: OutlineInputBorder(),
                  ),
                  items: _categoryOptions.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value;
                      _selectedExpenseType = _expenseTypeMapping[_selectedCategory!]![0];
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى اختيار نوع الفئة';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _selectedExpenseType,
                  decoration: const InputDecoration(
                    labelText: 'نوع المصروف',
                    border: OutlineInputBorder(),
                  ),
                  items: (_expenseTypeMapping[_selectedCategory!] ?? [])
                      .map((String expenseType) {
                    return DropdownMenuItem<String>(
                      value: expenseType,
                      child: Text(expenseType),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedExpenseType = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى اختيار نوع المصروف';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _costController,
                  decoration: const InputDecoration(
                    labelText: 'التكلفة',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال التكلفة';
                    }
                    if (double.tryParse(value) == null) {
                      return 'يرجى إدخال رقم صالح';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'لم يتم اختيار تاريخ'
                            : 'التاريخ: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          setState(() {
                            _selectedDate = picked;
                          });
                        }
                      },
                      child: const Text('اختر التاريخ'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _selectedDate != null) {
                      // عند التعديل، لا نقوم بتوليد UUID جديد؛ نستخدم الموجود مسبقاً
                      final updatedExpense = SetupExpense(
                        id: widget.expense.id,
                        globalId: widget.expense.globalId,
                        syncStatus: widget.expense.syncStatus,
                        categoryType: _selectedCategory!,
                        expenseType: _selectedExpenseType!,
                        materialName: null,
                        cost: double.parse(_costController.text),
                        date: _selectedDate!,
                      );
                      context.read<SetupExpenseBloc>().add(UpdateSetupExpenseEvent(updatedExpense));
                      Navigator.pop(context);
                    } else if (_selectedDate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('يرجى اختيار التاريخ')),
                      );
                    }
                  },
                  child: const Text('حفظ التعديلات'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _costController.dispose();
    super.dispose();
  }
}