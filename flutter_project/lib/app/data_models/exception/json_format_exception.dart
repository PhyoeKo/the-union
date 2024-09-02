import 'package:MultiCal/app/data_models/exception/base_exception.dart';

class JsonFormatException extends BaseException {
  JsonFormatException(String message) : super(message: message);
}
