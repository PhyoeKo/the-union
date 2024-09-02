import 'package:MultiCal/app/data_models/responses/patient_response.dart';
import 'package:MultiCal/app/data_sources/network/home/home_repository.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../constant/enum/view_state.dart';
import '../../../core/base/base_controller.dart';
import '../../../core/utils/app_utils.dart';
import '../../../core/utils/pagination_utils.dart';
import '../../../data_models/base_response/base_api_response.dart';
import '../../../data_models/exception/base_exception.dart';
import '../../../data_sources/network/home/home_repository_impl.dart';

class HomeController extends BaseController {
  late final HomeRepository _repository = HomeRepositoryImpl();
  RxList<PatientData> patientList = RxList.empty();

  RefreshController refreshController = RefreshController();
  late PaginationUtils samplePagination = PaginationUtils();

  @override
  void onInit() {
    super.onInit();
    getDummyList();
  }

  //#patient API Call
  Future<void> resetAndGetDummyList() async {
    patientList.clear();
    samplePagination = PaginationUtils();
    getDummyList();
  }

  void getDummyList() async {
    if (samplePagination.isPageAvailable()) {
      final repoService = _repository.getPatientList();
      if (patientList.isEmpty) updatePageState(ViewState.LOADING);
      await callAPIService(
        repoService,
        onSuccess: _handlePatientListResponseSuccess,
        onError: _handlePatientListResponseError,
      );
    }
  }

  void _handlePatientListResponseSuccess(response) async {
    resetRefreshController(refreshController);
    if (response != null) {
      BaseApiResponse<PatientResponse> _patientData = response;

      PatientResponse patientResponse = _patientData.objectResult;
      patientList.addAll(patientResponse.data!.toList());
      if (patientList.isEmpty) {
        Future.delayed(
          const Duration(seconds: 1),
          () => updatePageState(ViewState.EMPTY_LIST),
        );
      }
    }
  }

  void _handlePatientListResponseError(BaseException exception) {
    resetRefreshController(refreshController);
    if (patientList.isEmpty) {
      updatePageState(
        ViewState.FAILED,
        onClickTryAgain: () => resetAndGetDummyList(),
      );
    } else {
      AppUtils.showToast(exception.message);
    }
    return;
  }
}
