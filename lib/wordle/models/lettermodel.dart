import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wordle/constants.dart';

enum LetterStatus{initial, notInWord,InWord, correct}

class Letter extends Equatable {
  const Letter({
    required this.val,
    this.status = LetterStatus.initial
  });

  factory Letter.empty() => const Letter(val: '');

  final String val;

  final LetterStatus status;

  Color get backgroundColor {
    switch (status) {
      case LetterStatus.initial:
        return Colors.transparent;
      case LetterStatus.notInWord:
        return notInWordColor;
      case LetterStatus.InWord:
        return inWordColor;
      case LetterStatus.correct:
        return correctColor;
    }
  }

  Color get borerColor {
    switch (status) {
      case LetterStatus.initial:
        return Colors.grey;
      default:
        return Colors.transparent;
    }
  }
  Letter copyWith({
  String? val,
    LetterStatus? status,

}){
    return Letter(
        val:  val ?? this.val,
      status: status?? this.status
    );
  }

  @override
  List<Object?> get props => [val,status];

}