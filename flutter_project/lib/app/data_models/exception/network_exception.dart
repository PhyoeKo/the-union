import 'package:MultiCal/app/data_models/exception/base_exception.dart';

class NetworkException extends BaseException {
  NetworkException(String message) : super(message: message);
}
