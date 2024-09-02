


import 'package:MultiCal/app/data_models/responses/login_response.dart';

import '../../../data_models/base_response/base_api_response.dart';
import '../../../data_models/request_object/login_request_ob.dart';

abstract class AuthRepository {
  Future<BaseApiResponse<LoginResponse>> doLogin(LoginRequest loginReq);
}