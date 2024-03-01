import 'package:bloc/bloc.dart';
import 'package:bloc_api_project/repo_data/product_repo.dart';
import 'package:equatable/equatable.dart';

import '../model/product_api_model.dart';

part 'api_project_event.dart';
part 'api_project_state.dart';

class ApiProjectBloc extends Bloc<ApiProjectEvent, ApiProjectState> {
  final ProductsRepo productsRepo;

  ApiProjectBloc(this.productsRepo) : super(const ApiProjectInitial()) {
    on<ApiProductsLoadedEvent>((event, emit) async {
      try {
        emit(ApiProductsLoadingState());
        var data = await ProductsRepo().getProducts();
        emit(ApiProductsLoadedState(data));
      } catch (e) {
        emit(ApiProductsErrorState(e.toString()));
      }
    });
  }
}
