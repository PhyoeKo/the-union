

import 'package:MultiCal/app/data_models/base_response/base_api_response.dart';
import 'package:MultiCal/app/data_models/responses/login_response.dart';
import 'package:MultiCal/app/data_sources/network/auth/auth_repository.dart';
import '../../../constant/app_constant.dart';
import '../../../core/base/base_remote_source.dart';
import '../../../data_models/request_object/login_request_ob.dart';

class AuthRepositoryImpl extends BaseRemoteSource
    implements AuthRepository {
  @override
  Future<BaseApiResponse<LoginResponse>> doLogin(LoginRequest loginRequestOb) {
    var endpoint = "${AppConstant.baseURL}/api/login";

    var dioCall = dioClient.post(endpoint, data: loginRequestOb.toJson());
    try {
      return callApiWithErrorParser(dioCall).then(
            (response) => BaseApiResponse<LoginResponse>.fromObjectJson(
          response.data,
          createObject: (data) => LoginResponse.fromJson(data),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }


}