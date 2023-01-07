import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'adviser_event.dart';
part 'adviser_state.dart';

class AdviserBloc extends Bloc<AdviserEvent, AdviserState> {
  AdviserBloc() : super(AdviserInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviserStateLoading());

      // execute business logic
      debugPrint('getting fake advice');
      await Future.delayed(const Duration(seconds: 3), () {});
      debugPrint('got fake advice');
      // emit(AdviserStateLoaded(advice: 'fake advice to test bloc'));
      emit(AdviserStateError(message: 'Something went wrong'));
    });
  }
}
