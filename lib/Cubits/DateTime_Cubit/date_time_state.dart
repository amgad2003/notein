import 'package:flutter/material.dart';

class ReminderState {
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;

  ReminderState({
    this.selectedDate,
    this.selectedTime,
  });

  ReminderState copyWith({
    DateTime? selectedDate,
    TimeOfDay? selectedTime,
  }) {
    return ReminderState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }
}