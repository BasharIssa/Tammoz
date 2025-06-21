// lib/presentation/storage/widgets/quantity_manager.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/presentation/storage/bloc/storage_bloc.dart';

/// Widget for managing storage item quantity with increase/decrease buttons
///
/// Features:
/// - Visual feedback during operations
/// - Input validation
/// - Confirmation for critical operations
class QuantityManager extends StatefulWidget {
  final int storageId;
  final int currentQuantity;

  const QuantityManager({
    super.key,
    required this.storageId,
    required this.currentQuantity,
  });

  @override
  State<QuantityManager> createState() => _QuantityManagerState();
}

class _QuantityManagerState extends State<QuantityManager> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<StorageBloc, StorageState>(
      listener: (context, state) {
        if (state is StorageOperationSuccess || state is StorageOperationFailure) {
          setState(() => _isProcessing = false);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: _isProcessing
                ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
                : const Icon(Icons.remove),
            onPressed: _isProcessing ? null : () => _changeQuantity( -1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '${widget.currentQuantity}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          IconButton(
            icon: _isProcessing
                ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
                : const Icon(Icons.add),
            onPressed: _isProcessing ? null : () => _changeQuantity( 1),
          ),
        ],
      ),
    );
  }

  Future<void> _changeQuantity( int amount) async {
    setState(() => _isProcessing = true);

    if (amount < 0 && widget.currentQuantity+amount < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('لا يمكن تقليل الكمية أقل من الصفر')),
      );
      setState(() => _isProcessing = false);
      return;
    }

    final confirmed = amount < 0
        ? await _showConfirmationDialog( amount.abs())
        : true;

    if (!mounted) return; // تأكد أن الودجت ما زالت موجودة

    if (confirmed) {
      if (amount > 0) {
        context.read<StorageBloc>().add(IncreaseQuantity(
          storageId: widget.storageId,
          amount: amount,
        ));
      } else {
        context.read<StorageBloc>().add(DecreaseQuantity(
          storageId: widget.storageId,
          amount: amount.abs(),
        ));
      }
    } else {
      setState(() => _isProcessing = false);
    }
  }

  Future<bool> _showConfirmationDialog(int amount) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد العملية'),
        content: Text('هل أنت متأكد من رغبتك في تقليل الكمية بمقدار $amount؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('تأكيد'),
          ),
        ],
      ),
    ) ?? false;
  }
}