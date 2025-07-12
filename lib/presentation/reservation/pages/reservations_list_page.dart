// /presentation/reservation/pages/reservations_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_tammoz_chat/presentation/reservation/bloc/reservation_bloc.dart';
import 'package:local_tammoz_chat/presentation/reservation/widgets/reservation_list_item.dart';
import 'add_reservation_page.dart';

class ReservationsListPage extends StatefulWidget {
  const ReservationsListPage({super.key});

  @override
  State<ReservationsListPage> createState() => _ReservationsListPageState();
}

class _ReservationsListPageState extends State<ReservationsListPage> {
  @override
  void initState() {
    super.initState();
    context.read<ReservationBloc>().add(GetAllReservationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('كل الحجوزات'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AddReservationPage()),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<ReservationBloc, ReservationState>(
        builder: (context, state) {
          if (state is ReservationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AllReservationsLoaded) {
            if (state.reservations.isEmpty) {
              return const Center(child: Text('لا توجد حجوزات'));
            }
            return ListView.builder(
              itemCount: state.reservations.length,
              itemBuilder: (context, index) {
                final reservation = state.reservations[index];
                return ReservationListItem(reservation: reservation);
              },
            );
          } else if (state is ReservationError) {
            return Center(child: Text('خطأ: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
