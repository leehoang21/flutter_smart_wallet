import 'package:flutter_smart_wallet/common/configs/dio_config/base_response.dart';
import 'package:flutter_smart_wallet/common/configs/dio_config/dio_api_client.dart';
import 'package:flutter_smart_wallet/common/constants/api_path_constants.dart';
import 'package:flutter_smart_wallet/common/enums/app_enums.dart';

class VnBankRepository {
  final DioApiClient _dioApiClient;

  VnBankRepository(this._dioApiClient);

  Future<BaseResponse> getVnBankList() async {
    return DioApiClient()
        .request(method: NetworkMethod.get, url: ApiPathConstants.getVnBanks);
  }
}
