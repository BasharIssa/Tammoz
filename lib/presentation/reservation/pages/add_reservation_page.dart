// /presentation/reservation/pages/add_reservation_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:local_tammoz_chat/presentation/plant_shapes/bloc/plant_shape_bloc.dart';
import 'package:local_tammoz_chat/presentation/plant_shapes/bloc/plant_shape_events.dart';
import 'package:local_tammoz_chat/presentation/plant_shapes/bloc/plant_shape_states.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_bloc.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_events.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_states.dart';
import 'package:local_tammoz_chat/presentation/reservation/bloc/reservation_bloc.dart';

import '../../../domain/entities/plant_shape.dart';
import '../../../domain/entities/plant_type.dart';
import '../../../domain/entities/reservation.dart';

class AddReservationPage extends StatefulWidget {
  const AddReservationPage({super.key});

  @override
  State<AddReservationPage> createState() => _AddReservationPageState();
}

class _AddReservationPageState extends State<AddReservationPage> {
  final _formKey = GlobalKey<FormState>();

  List<PlantType> _plantTypes = [];
  List<PlantShape> _plantShapes = [];

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  DateTime _reservationDate = DateTime.now();
  DateTime? _deliveryDate;

  PlantType? _selectedPlantType;
  PlantShape? _selectedPlantShape;

  bool _isFullyPaid = false;
  bool _isDelivered = false;

  @override
  void initState() {
    super.initState();
    context.read<PlantTypeBloc>().add(LoadPlantTypes());
    context.read<PlantShapeBloc>().add(LoadPlantShapes());
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  Future<void> _selectReservationDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _reservationDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2040),
    );
    if (picked != null && picked != _reservationDate) {
      setState(() {
        _reservationDate = picked;
        // تحديث تاريخ التسليم إذا كان قبل تاريخ الحجز
        if (_deliveryDate != null && _deliveryDate!.isBefore(picked)) {
          _deliveryDate = picked;
        }
      });
    }
  }

  Future<void> _selectDeliveryDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _deliveryDate ?? _reservationDate,
      firstDate: _reservationDate,
      lastDate: DateTime(2040),
    );
    if (picked != null) {
      setState(() {
        _deliveryDate = picked;
      });
    }
  }

  Widget _buildPlantTypeDropdown() {
    if (_plantTypes.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('لم يتم تحميل أنواع النباتات'),
          TextButton(
            onPressed: () => context.read<PlantTypeBloc>().add(LoadPlantTypes()),
            child: const Text('إعادة المحاولة'),
          ),
        ],
      );
    }
    return DropdownButtonFormField<PlantType>(
      decoration: const InputDecoration(labelText: 'نوع النبات'),
      items: _plantTypes.map((plantType) {
        return DropdownMenuItem(
          value: plantType,
          child: Text(plantType.name),
        );
      }).toList(),
      value: _selectedPlantType,
      onChanged: (value) => setState(() => _selectedPlantType = value),
      validator: (value) => value == null ? 'يرجى اختيار نوع النبات' : null,
    );
  }

  Widget _buildPlantShapeDropdown() {
    if (_plantShapes.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('لم يتم تحميل أشكال النباتات'),
          TextButton(
            onPressed: () => context.read<PlantShapeBloc>().add(LoadPlantShapes()),
            child: const Text('إعادة المحاولة'),
          ),
        ],
      );
    }
    return DropdownButtonFormField<PlantShape>(
      decoration: const InputDecoration(labelText: 'شكل النبات'),
      items: _plantShapes.map((plantShape) {
        return DropdownMenuItem(
          value: plantShape,
          child: Text(plantShape.name),
        );
      }).toList(),
      value: _selectedPlantShape,
      onChanged: (value) => setState(() => _selectedPlantShape = value),
      validator: (value) => value == null ? 'يرجى اختيار شكل النبات' : null,
    );
  }

  void _submit() {
    if (_formKey.currentState?.validate() != true) return;

    final quantity = int.parse(_quantityController.text.trim());

    final newReservation = Reservation(
      fullName: _fullNameController.text.trim(),
      phone: _phoneController.text.trim(),
      reservationDate: _reservationDate,
      deliveryDate: _deliveryDate,
      plantType: _selectedPlantType!,
      plantShape: _selectedPlantShape!,
      quantity: quantity,
      deposit: null,
      isFullyPaid: _isFullyPaid,
      isDelivered: _isDelivered,
      notes: null,
    );

    context
        .read<ReservationBloc>()
        .add(CreateReservationEvent(reservation: newReservation));
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy-MM-dd');
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة حجز جديد'),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<PlantTypeBloc, PlantTypeState>(
            listener: (context, state) {
              if (state is PlantTypeLoaded) {
                setState(() {
                  _plantTypes = state.plantTypes;
                });
              } else if (state is PlantTypeError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
          BlocListener<PlantShapeBloc, PlantShapeStates>(
            listener: (context, state) {
              if (state is PlantShapesLoaded) {
                setState(() {
                  _plantShapes = state.plantShapes;
                });
              } else if (state is PlantShapesError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
          BlocListener<ReservationBloc, ReservationState>(
            listener: (context, state) {
              if (state is ReservationCreated) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم إضافة الحجز بنجاح')),

                );
                context.read<ReservationBloc>().add(GetAllReservationsEvent());
                Navigator.of(context).pop();
              } else if (state is ReservationError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('خطأ: ${state.message}')),
                );
              }
            },
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(labelText: 'الاسم الكامل'),
                  validator: (value) =>
                  (value == null || value.trim().isEmpty) ? 'يرجى إدخال الاسم' : null,
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'رقم الهاتف'),
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                  (value == null || value.trim().isEmpty) ? 'يرجى إدخال رقم الهاتف' : null,
                ),
                _buildPlantTypeDropdown(),
                _buildPlantShapeDropdown(),
                TextFormField(
                  controller: _quantityController,
                  decoration: const InputDecoration(labelText: 'الكمية'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    final q = int.tryParse(value ?? '');
                    if (q == null || q <= 0) {
                      return 'يرجى إدخال كمية صحيحة أكبر من صفر';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                ListTile(
                  title: Text(
                      'تاريخ الحجز: ${dateFormat.format(_reservationDate)}'),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () => _selectReservationDate(context),
                ),
                ListTile(
                  title: Text(
                      'تاريخ التسليم: ${_deliveryDate != null ? dateFormat.format(_deliveryDate!) : "غير محدد"}'),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () => _selectDeliveryDate(context),
                ),

                SwitchListTile(
                  title: const Text('تم الدفع كاملاً'),
                  value: _isFullyPaid,
                  onChanged: (val) => setState(() => _isFullyPaid = val),
                ),
                SwitchListTile(
                  title: const Text('تم التسليم'),
                  value: _isDelivered,
                  onChanged: (val) => setState(() => _isDelivered = val),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text('إضافة الحجز'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
