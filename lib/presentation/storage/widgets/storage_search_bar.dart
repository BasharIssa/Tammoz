// lib/presentation/widgets/storage/storage_search_bar.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/storage_bloc.dart';

class StorageSearchBar extends StatefulWidget {
  const StorageSearchBar({super.key});

  @override
  StorageSearchBarState createState() => StorageSearchBarState();
}

class StorageSearchBarState extends State<StorageSearchBar> {
  final _plantTypeController = TextEditingController();
  final _plantShapeController = TextEditingController();

  @override
  void dispose() {
    _plantTypeController.dispose();
    _plantShapeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _plantTypeController,
            decoration: const InputDecoration(
              labelText: 'بحث بنوع النبات',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => _search(),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _plantShapeController,
            decoration: const InputDecoration(
              labelText: 'بحث بشكل النبات',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => _search(),
          ),
        ],
      ),
    );
  }

  void _search() {
    context.read<StorageBloc>().add(SearchStorages(
      plantType: _plantTypeController.text.isNotEmpty ? _plantTypeController.text : null,
      plantShape: _plantShapeController.text.isNotEmpty ? _plantShapeController.text : null,
    ));
  }
}