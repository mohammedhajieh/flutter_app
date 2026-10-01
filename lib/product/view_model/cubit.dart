import 'package:first_app/product/view_model/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitState());

  int count = 0;
  bool isFavouirte = false;

  void changeFavouirte() {
    isFavouirte = !isFavouirte;
    emit(ProductChangeFavouirteState());
  }

  void decremnent() {
    count--;
    emit(ProductChangeCountState());
  }

  void incremnent() {
    count++;
    emit(ProductChangeCountState());
  }
}
