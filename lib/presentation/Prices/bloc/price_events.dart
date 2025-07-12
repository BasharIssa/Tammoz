// lib/presentation/bloc/price/price_event.dart
part of 'price_bloc.dart';

abstract class PriceEvent extends Equatable {
  const PriceEvent();

  @override
  List<Object?> get props => [];
}

class LoadAllPrices extends PriceEvent {}

class LoadPriceById extends PriceEvent {
  final int id;

  const LoadPriceById(this.id);

  @override
  List<Object?> get props => [id];
}

class InsertPrice extends PriceEvent {
  final Price price;

  const InsertPrice(this.price);

  @override
  List<Object?> get props => [price];
}

class UpdatePrice extends PriceEvent {
  final Price price;

  const UpdatePrice(this.price);

  @override
  List<Object?> get props => [price];
}

class DeletePrice extends PriceEvent {
  final int id;

  const DeletePrice(this.id);

  @override
  List<Object?> get props => [id];
}
