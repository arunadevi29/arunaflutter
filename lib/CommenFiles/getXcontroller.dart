import 'package:attendanceapp/Screens/LoginScreen/Controller/LoginScreenController.dart';
import 'package:attendanceapp/Screens/PieChartScreen/controller/Piechartcontroller.dart';
import 'package:attendanceapp/Screens/SignUpScreen/Controller/SignUpController.dart';
import 'package:get/get.dart';

import '../Screens/AddUser/controller/AddUserScreenController.dart';

import '../Screens/AddWorkType/controller/AddWorkTypeController.dart';
import '../Screens/Admin/AdminDashboard/controller/AdminDashboardController.dart';

import '../Screens/Admin/FacilityAddListItems/controller/FacilityAddListItemsController.dart';
import '../Screens/Admin/FacilityCardDetails/controller/FacilityCardDetailsController.dart';
import '../Screens/Admin/FacilityCardListview/controller/FacilityCardListviewController.dart';

import '../Screens/ContractorAddWorker/controller/ContractorAddWorkerController.dart';
import '../Screens/ForgetPasswordScreen/Controller/forgetpasswordController.dart';
import '../Screens/LoginScreen/Controller/LoginScreenController.dart';
import '../Screens/OTPVerificationScreen/Controller/OtpController.dart';
import '../Screens/PunchScreenField/PunchInScreen/Controller/PunchInController.dart';
import '../Screens/PunchScreenField/PunchOutScreen/Controller/PunchOutController.dart';
import '../Screens/PunchScreenField/PunchScreen/Controller/PunchScreenController.dart';
import '../Screens/SettingsScreen/Controller/Settingscontroller.dart';
import '../Screens/ShiftTime/ShiftTimeScreen/controller/ShiftTimeFromController.dart';
import '../Screens/SiteHeader/AddContractor/controller/AddContractorController.dart';
import '../Screens/SiteHeader/AddReportManager/controller/AddReportController.dart';
import '../Screens/SiteHeader/AddSiteHead/controller/AddSiteHeadController.dart';
import '../Screens/SiteHeader/AddSiteWorker/controller/AddSiteWorkerController.dart';
import '../Screens/SiteHeader/WorkerDetails/controller/WorkerDetailsController.dart';
import '../Screens/SiteHeader/WorkerList/controller/WorkerListController.dart';
import '../Screens/SiteheadDashboardUser/controller/SiteheadDashboardUser.dart';
import '../Screens/UserDetailsScreen/controller/UserCardController.dart';
import '../Screens/UserListAddContractor/controller/UserListAddContractorController.dart';
import '../Screens/UserListAddReport/controller/UserListAddReportController.dart';
import '../Screens/UserListAddSiteHeader/controller/UserListSiteHeaderController.dart';
import '../Screens/UserScreen/Controller/UserScreenController.dart';
import '../Screens/Work/controller/WorkScreenController.dart';
import 'controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogInController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => Forgetpasswordcontroller());
    Get.lazyPut(() => OtpController());
    Get.lazyPut(() => PunchinController());
    Get.lazyPut(() => PunchOutController());
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => AdminDashboardcontroller());
    Get.lazyPut(() => PiechartController());
    Get.lazyPut(() => PunchScreenController());
    Get.lazyPut(() => WorkerListController());
    Get.lazyPut(() => WorkerDetailsController());
    Get.lazyPut(() => UserCardController());
    Get.lazyPut(() => UserListAddContractorController());
    Get.lazyPut(() => UserListAddReportController());
    Get.lazyPut(() => UserListSiteHeaderController());
    Get.lazyPut(() => UserScreenController());
    Get.lazyPut(() => AddContractorController());
    Get.lazyPut(() => AddReportController());
    Get.lazyPut(() => AddSiteHeadController());
    Get.lazyPut(() => AddSiteWorkerController());
    Get.lazyPut(() => AddUserScreenController());
    Get.lazyPut(() => FacilityAddListItemsController());
    Get.lazyPut(() => FacilityCardListviewController());
    Get.lazyPut(() => FacilityCardDetailsController());
    Get.lazyPut(() => ContractorAddWorkerController());
    Get.lazyPut(() => AddWorkTypeController());
    Get.lazyPut(() => WorkScreenController());
    Get.lazyPut(() => ShifttimeformController());
    Get.lazyPut(() => SiteheadUserController());
    Get.lazyPut(() => Controller());
  }
}

final LogInController logInController = Get.find();
final SignUpController signUpController = Get.find();
final Forgetpasswordcontroller forgetpasswordcontroller = Get.find();
final OtpController otpController = Get.find();
final PiechartController piechartController = Get.find();
final PunchScreenController punchScreenController = Get.find();
final PunchinController punchinController = Get.find();
final PunchOutController punchOutController = Get.find();
final SettingsController settingsController = Get.find();
final AdminDashboardcontroller adminDashboardcontroller = Get.find();
final WorkerListController workerListController = Get.find();
final WorkerDetailsController workerDetailsController = Get.find();
final UserCardController userCardController = Get.find();
final UserListAddContractorController userListAddContractorController =
Get.find();
final UserListAddReportController userListAddReportController = Get.find();
final UserListSiteHeaderController userListSiteHeaderController = Get.find();
final UserScreenController userScreenController = Get.find();
final AddContractorController addContractorController = Get.find();
final AddReportController addReportController = Get.find();
final AddSiteHeadController addSiteHeadController = Get.find();
final AddSiteWorkerController addSiteWorkerController = Get.find();
final AddUserScreenController addUserScreenController = Get.find();
final FacilityAddListItemsController facilityAddListItemsController =
Get.find();
final FacilityCardListviewController facilityCardListviewController =
Get.find();
final FacilityCardDetailsController facilityCardDetailsController = Get.find();
final ContractorAddWorkerController contractorAddWorkerController = Get.find();
final AddWorkTypeController addWorkTypeController = Get.find();
final WorkScreenController workScreenController = Get.find();
final ShifttimeformController shifttimeformController = Get.find();
final SiteheadUserController siteheadUserController = Get.find();
final Controller controller = Get.find();
