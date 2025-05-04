import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart'; // مكتبة UUID
import '../../../domain/entities/setup_expense.dart';
import '../bloc/setup_expense_bloc.dart';
import '../bloc/setup_expense_event.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  _AddExpensePageState createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final _formKey = GlobalKey<FormState>();

  // قائمة الفئات الثابتة
  final List<String> _categoryOptions = [
    "نايلون",
    "ناموسيات",
    "صقيع",
    "تعقيم"
  ];

  // تعريف mapping بين كل فئة وخيارات المصروف الخاصة بها
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

  // المتغيرات لتخزين القيم المحددة
  String? _selectedCategory;
  String? _selectedExpenseType;

  final TextEditingController _costController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  // كائن UUID لتوليد المعرفات
  final Uuid uuid = Uuid();

  @override
  void initState() {
    super.initState();
    _selectedCategory = _categoryOptions[0];
    _selectedExpenseType = _expenseTypeMapping[_selectedCategory!]![0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة مصروف'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // قائمة منسدلة لاختيار نوع الفئة
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
                // قائمة منسدلة لاختيار نوع المصروف
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
                // حقل إدخال التكلفة مع تقييد الإدخال على الأرقام فقط
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
                // اختيار التاريخ
                Row(
                  children: [
                    Expanded(
                      child: Text(
                             'التاريخ: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate ?? DateTime.now(),
                          firstDate: DateTime(2025),
                          lastDate: DateTime(2050),
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
                // زر الإضافة
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _selectedDate != null) {
                      // توليد UUID جديد للسجل
                      final String newGlobalId = uuid.v4();
                      // إنشاء كائن المصروف مع تعيين globalId وحالة المزامنة "pending"
                      final expense = SetupExpense(
                        globalId: newGlobalId,
                        categoryType: _selectedCategory!,
                        expenseType: _selectedExpenseType!,
                        materialName: null,
                        cost: double.parse(_costController.text),
                        date: _selectedDate!,
                      );
                      context.read<SetupExpenseBloc>().add(AddSetupExpenseEvent(expense));
                      Navigator.pop(context);
                    } else if (_selectedDate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('يرجى اختيار التاريخ')),
                      );
                    }
                  },
                  child: const Text('أضف المصروف'),
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