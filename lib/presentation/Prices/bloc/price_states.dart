// lib/presentation/bloc/price/price_state.dart
part of 'price_bloc.dart';

abstract class PriceState extends Equatable {
  const PriceState();

  @override
  List<Object?> get props => [];
}

class PriceInitial extends PriceState {}

class PriceLoading extends PriceState {}

class PriceLoadSuccess extends PriceState {
  final List<Price> prices;

  const PriceLoadSuccess(this.prices);

  @override
  List<Object?> get props => [prices];
}

class PriceOperationSuccess extends PriceState {}

class PriceError extends PriceState {
  final String message;

  const PriceError(this.message);

  @override
  List<Object?> get props => [message];
}
