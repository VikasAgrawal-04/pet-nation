import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure() : super();
}

class ServerFailure extends Failure with EquatableMixin {
  ServerFailure({this.message = 'Some unexpected server failure occured!'})
      : super();
  final String message;

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return message;
  }
}
