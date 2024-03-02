part of 'cart_count_cubit.dart';

abstract class CartCountState extends Equatable {
  final int cartItemCount;
  const CartCountState(this.cartItemCount);
}

class CartCountInitial extends CartCountState {
  const CartCountInitial(super.cartItemCount);

  @override
  List<Object> get props => [cartItemCount];
}

class CartCountUpdate extends CartCountState {
  const CartCountUpdate(super.cartItemCount);

  @override
  List<Object?> get props => [cartItemCount];
}
