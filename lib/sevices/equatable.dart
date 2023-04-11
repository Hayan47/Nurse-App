import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class KeyValueRecordType extends Equatable {
  String key;
  String value;

  KeyValueRecordType({required this.key, required this.value});

  @override
  List<Object> get props => [key, value];
}
