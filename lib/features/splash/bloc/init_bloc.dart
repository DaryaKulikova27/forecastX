import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecast_x/db/db.dart';

part 'init_event.dart';
part 'init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  bool isLoading = true;
  InitBloc() : super(InitInitial()) {
    on<InitShowLoaderEvent>(
      (event, emit) async {
        await Future.delayed(const Duration(milliseconds: 1500));
        if (isLoading) {
          emit(InitInitial());
        }
      },
    );

    on<InitAppEvent>(
      (event, emit) async {
        isLoading = false;
        bool isFirstLaunch = await DB.instance.getIsFirstLaunch();
        if (isFirstLaunch) {
          emit(InitialFirstOpenComleted());
        } else {
          emit(InitialComleted());
        }
      },
    );
  }
}
