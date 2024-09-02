import 'package:MultiCal/app/core/base/base_remote_source.dart';
import 'package:MultiCal/app/core/config/flavour_manager.dart';
import 'package:MultiCal/app/data_models/base_response/base_api_response.dart';
import 'package:MultiCal/app/data_models/responses/dummy_list_response.dart';
import 'package:MultiCal/app/data_models/responses/patient_response.dart';
import 'package:MultiCal/app/data_sources/network/home/home_repository.dart';
import 'package:dio/dio.dart';

import '../../../constant/app_constant.dart';

class HomeRepositoryImpl extends BaseRemoteSource implements HomeRepository {
  @override
  Future<BaseApiResponse<PatientResponse>> getPatientList() async {
    var endpoint = "${AppConstant.baseURL}/api/patients";
    var dioCall = dioClient.get(endpoint);
    try {
      return callApiWithErrorParser(dioCall).then(
        (response) => _parseBannerResponse(response),
      );
    } catch (e) {
      rethrow;
    }
  }

  BaseApiResponse<PatientResponse> _parseBannerResponse(Response response) {
    return BaseApiResponse<PatientResponse>.fromObjectJson(response.data,
        createObject: (data) => PatientResponse.fromJson(data));
  }
}
