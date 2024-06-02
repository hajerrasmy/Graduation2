import 'package:flutter_bloc/flutter_bloc.dart';

class HeightCubit extends Cubit<double> {
  HeightCubit() : super(170.0);

  void updateHeight(double newHeight) {
    emit(newHeight);
  }
}
