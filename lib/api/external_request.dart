import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:template_flutter/common/config.dart';
import 'package:template_flutter/api/basic_client.dart';
import 'package:template_flutter/data_package/request/validate_business_detail_reqe.dart';
import 'package:template_flutter/data_package/response/validate_business_detail_resp.dart';

part 'external_request.g.dart';

@RestApi(baseUrl: DefinedAPI.PUBLIC_DATA_PORTAL)
abstract class ExReq {
  factory BasicClient(Dio dio, {String baseUrl}) = _ExReq;

  @POST('/nts-businessman/v1/validate')
  Future<ValidateBusinessDetailRESP> checkRegistrationNumberValidation(
      @Body() ValidateBusinessDetailREQE body);
}
