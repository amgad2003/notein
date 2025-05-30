

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'date_time_state.dart';

class ReminderCubit extends Cubit<ReminderState> {
  ReminderCubit() : super(ReminderState());

  void setDate(DateTime date) {
    emit(state.copyWith(selectedDate: date));
  }

  void setTime(TimeOfDay time) {
    emit(state.copyWith(selectedTime: time));
  }

  DateTime? getFullScheduleDateTime() {
    if (state.selectedDate != null && state.selectedTime != null) {
      return DateTime(
        state.selectedDate!.year,
        state.selectedDate!.month,
        state.selectedDate!.day,
        state.selectedTime!.hour,
        state.selectedTime!.minute,
      );
    }
    return null;
  }

}