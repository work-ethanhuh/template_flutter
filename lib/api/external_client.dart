import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:template_flutter/common/config.dart';
import 'package:template_flutter/api/basic_client.dart';
import 'package:template_flutter/data_package/request/validate_business_detail_requ.dart';
import 'package:template_flutter/data_package/response/validate_business_detail_resp.dart';

part 'external_client.g.dart';

@RestApi(baseUrl: DefinedAPI.PUBLIC_DATA_PORTAL)
abstract class ExternalClient {
  factory ExternalClient(Dio publicPortal, {String baseUrl}) = _ExternalClient;

  @POST('/nts-businessman/v1/validate')
  Future<ValidateBusinessDetailRESP> checkRegistrationNumberValidation(
      @Body() ValidateBusinessDetailREQU body);
}
