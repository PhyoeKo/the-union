import 'package:MultiCal/app/data_models/base_response/base_api_response.dart';
import 'package:MultiCal/app/data_models/responses/dummy_list_response.dart';
import 'package:MultiCal/app/data_models/responses/patient_response.dart';

abstract class HomeRepository {
  Future<BaseApiResponse<PatientResponse>> getPatientList();
}
