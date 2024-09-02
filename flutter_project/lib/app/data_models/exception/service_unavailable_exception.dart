import 'dart:io';

import 'package:MultiCal/app/data_models/exception/base_api_exception.dart';

class ServiceUnavailableException extends BaseApiException {
  ServiceUnavailableException(String message)
      : super(
          httpCode: HttpStatus.serviceUnavailable,
          message: message,
          status: "",
        );
}
