import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_count_state.dart';

class CartCountCubit extends Cubit<CartCountState> {
  CartCountCubit() : super(const CartCountInitial(0));
  void increment() {
    emit(CartCountUpdate(state.cartItemCount + 1));
  }

  void decrement() {
    emit(CartCountUpdate(state.cartItemCount - 1));
  }
}
