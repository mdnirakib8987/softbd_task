
import '../../../global/constants/enum.dart';

enum AppConfig {
  base,
  baseImage,
  logInUrl,
  userProfileUrl,
  companyInfoUrl,
  changePasswordUrl,

  vehicleTypeListUrl,
  requisitionListUrl,
  districtUrl,
  requisitionSubmitUrl,

  directoryRequisitionListUrl,
  dgmRequisitionListUrl,
  tsoRequisitionListUrl,

  forwardTsoUrl,
  approvalTsoUrl,

  noticeUrl,
  sliderListUrl,

}

extension AppUrlExtention on AppConfig {
  static String _baseUrl = "";
  // static String _baseImageUrl = "";

  static void setUrl(UrlLink urlLink) {
    switch (urlLink) {
      case UrlLink.isLive:
        _baseUrl = "";
        // _baseImageUrl = "";
        break;
      case UrlLink.isDev:
        _baseUrl = "https://brrivms.softwaresale.xyz";
        // _baseImageUrl = "https://brrivms.softwaresale.xyz";

        break;
      case UrlLink.isLocalServer:
        _baseUrl = "";
        // _baseImageUrl = "";
        break;
    }
  }

  String get url {
    switch (this) {
      case AppConfig.base:
        return _baseUrl;
      case AppConfig.baseImage:
        return "";

    /// ==/@ Auth Api Url @/==
      case AppConfig.logInUrl:
        return '/api/login';
      case AppConfig.userProfileUrl:
        return '/api/profile';
      case AppConfig.companyInfoUrl:
        return '/api/brri/info';
      case AppConfig.changePasswordUrl:
        return '/api/change_password';


      case AppConfig.vehicleTypeListUrl:
        return '/api/vehicle/type';
      case AppConfig.requisitionListUrl:
        return '/api/employee/requisition/list';
      case AppConfig.districtUrl:
        return '/api/district';
      case AppConfig.requisitionSubmitUrl:
        return '/api/requisition/submit';

      case AppConfig.directoryRequisitionListUrl:
        return '/api/requisition/list/director';
      case AppConfig.dgmRequisitionListUrl:
        return '/api/employee/requisition/list/dgm';
      case AppConfig.tsoRequisitionListUrl:
        return '/api/employee/requisition/list/tso';
      case AppConfig.forwardTsoUrl:
        return '/api/requisition/forward/tso';
      case AppConfig.approvalTsoUrl:
        return '/api/requisition/approve/tso';

      case AppConfig.noticeUrl:
        return '/api/notice/list';
      case AppConfig.sliderListUrl:
        return '/api/slider/list';



      default:
    }
    return "";
  }
}
