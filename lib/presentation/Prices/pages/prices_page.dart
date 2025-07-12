// lib/presentation/prices/pages/prices_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/domain/entities/plant_shape.dart';
import 'package:local_tammoz_chat/domain/entities/plant_type.dart';
import 'package:local_tammoz_chat/domain/entities/price.dart';
import 'package:local_tammoz_chat/presentation/plant_shapes/bloc/plant_shape_bloc.dart';
import 'package:local_tammoz_chat/presentation/plant_shapes/bloc/plant_shape_events.dart';
import 'package:local_tammoz_chat/presentation/plant_shapes/bloc/plant_shape_states.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_bloc.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_events.dart';
import 'package:local_tammoz_chat/presentation/plant_types/bloc/plant_type_states.dart';

import '../bloc/price_bloc.dart';
import '../widgets/add_price_dialog.dart';

class PricesPage extends StatefulWidget {
  const PricesPage({super.key});

  @override
  State<PricesPage> createState() => _PricesPageState();
}

class _PricesPageState extends State<PricesPage> {

  List<PlantType> _plantTypes = [];
  List<PlantShape> _plantShapes = [];

  @override
  void initState() {
    super.initState();
    // تحميل كل الأسعار عند بدء الصفحة
    context.read<PriceBloc>().add(LoadAllPrices());
    context.read<PlantShapeBloc>().add(LoadPlantShapes());
    context.read<PlantTypeBloc>().add(LoadPlantTypes());
  }

  Future<void> _showAddOrEditPriceDialog({Price? price}) async {
    if (_plantTypes.isEmpty || _plantShapes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى تحميل أنواع وأشكال النباتات أولاً')),
      );
      return;
    }

    final result = await AddPriceDialog.show(
      context,
      plantTypes: _plantTypes,
      plantShapes: _plantShapes,
      initialPrice: price,
    );

    if (result != null && mounted) {
      if (price == null) {
        context.read<PriceBloc>().add(InsertPrice(result));
      } else {
        context.read<PriceBloc>().add(UpdatePrice(result));
      }
    }
  }

  void _onDeletePrice(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد الحذف'),
        content: const Text('هل أنت متأكد من حذف السعر؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<PriceBloc>().add(DeletePrice(id));
            },
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('قائمة الأسعار')),
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
        ],
        child: BlocConsumer<PriceBloc, PriceState>(
          listener: (context, state) {
            if (state is PriceError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is PriceOperationSuccess) {
              context.read<PriceBloc>().add(LoadAllPrices());
            }
          },
          builder: (context, state) {
            if (state is PriceLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PriceLoadSuccess) {
              if (state.prices.isEmpty) {
                return const Center(child: Text('لا توجد أسعار'));
              }
              return ListView.builder(
                itemCount: state.prices.length,
                itemBuilder: (context, index) {
                  final price = state.prices[index];
                  return ListTile(
                    title: Text('${price.plantType.name} - ${price.plantShape.name}'),
                    subtitle: Text('السعر: ${price.price.toStringAsFixed(2)}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _showAddOrEditPriceDialog(price: price),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _onDeletePrice(price.id!),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (state is PriceError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddOrEditPriceDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
