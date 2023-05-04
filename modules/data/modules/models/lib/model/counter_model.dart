
import 'package:freezed_annotation/freezed_annotation.dart';
part 'counter_model.freezed.dart';
@freezed
class CounterModel with _$CounterModel{
  const CounterModel._();

  const factory CounterModel({
    required int counter,
  }) = _CounterModel;
}