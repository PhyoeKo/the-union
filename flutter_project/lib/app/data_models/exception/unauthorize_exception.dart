import 'dart:io';

import 'package:MultiCal/app/data_models/exception/base_api_exception.dart';

class UnauthorizedException extends BaseApiException {
  UnauthorizedException(String message)
      : super(
          httpCode: HttpStatus.unauthorized,
          message: message,
          status: "unauthorized",
        );
}
