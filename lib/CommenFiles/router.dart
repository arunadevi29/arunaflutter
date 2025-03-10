import 'package:attendanceapp/Screens/OTPVerificationScreen/view/OTPVerificationScreen.dart';
import 'package:attendanceapp/Screens/SignUpScreen/view/SignUpScreen.dart';
import 'package:attendanceapp/Screens/SiteheadDashboardUser/view/SiteheaddashboardUser.dart';
import 'package:attendanceapp/Screens/SplashScreen/SplashScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../Screens/AddUser/view/AddUserScreen.dart';
import '../Screens/AddWorkType/view/AddWorkTypescreen.dart';
import '../Screens/Admin/AdminDashboard/view/Admin_Dashboard_Screen.dart';
import '../Screens/Admin/FacilityAddListItems/view/Facility_add_List_items.dart';
import '../Screens/Admin/FacilityCardDetails/view/Facilities_Screen.dart';
import '../Screens/Admin/FacilityCardListview/view/Facilities_Card_Items.dart';
import '../Screens/Admin/FacilityDetails/View/FacilityDetails.dart';
import '../Screens/ForgetPasswordScreen/view/ForgetPasswordScreen.dart';
import '../Screens/LoginScreen/view/LoginScreen.dart';
import '../Screens/PieChartScreen/view/PieChartScreen.dart';
import '../Screens/PunchScreenField/PunchInScreen/view/PunchInScreen.dart';
import '../Screens/PunchScreenField/PunchOutScreen/view/PunchOutScreen.dart';
import '../Screens/PunchScreenField/PunchScreen/view/PunchScreen.dart';
import '../Screens/SettingsScreen/view/SettingsScreen.dart';
import '../Screens/ShiftTime/ShiftTimeScreen/view/ShiftTimeViewScreen.dart';
import '../Screens/ShiftTime/ShiftTimeScreen/view/Shift_Time_From_screen.dart';
import '../Screens/SiteHeadDashboard/view/SiteheadDashboard.dart';
import '../Screens/SiteHeader/AddContractor/view/SiteHeadAddContractorScreen.dart';
import '../Screens/SiteHeader/AddReportManager/view/AdminAddReportManagerScreen.dart';
import '../Screens/SiteHeader/AddSiteHead/view/AdminAddSiteHeadScreen.dart';
import '../Screens/SiteHeader/AddSiteWorker/view/SiteHeadAddSiteWorkerScreen.dart';
import '../Screens/SiteHeader/WorkerDetails/view/WorkerDetailsScreen.dart';
import '../Screens/SiteHeader/WorkerList/view/WorkerListScreen.dart';
import '../Screens/SiteheadDashboardUser/controller/SiteheadDashboardUser.dart';
import '../Screens/UserDetailsScreen/view/UserDetailsScreen.dart';
import '../Screens/UserListAddContractor/view/AddContractorUserList.dart';
import '../Screens/UserListAddReport/view/AddReportUserList.dart';
import '../Screens/UserListAddSiteHeader/view/AddSiteHeaderUser.dart';
import '../Screens/UserScreen/view/UserScreen.dart';
import '../Screens/Work/view/Work_Type_Screen.dart';
import 'functions.dart';
import 'getXcontroller.dart';

// final String? userId = localStorage.read('userId');
// final String? token = localStorage.read('api_token');
// final String? userName = localStorage.read('userName');
final routes = [
  GetPage(
      name: '/signIn',
      page: () => Loginscreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Otpverificationscreen',
      page: () => const Otpverificationscreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Signupscreen',
      page: () => const Signupscreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Splashscreen',
      page: () => const Splashscreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Adduserscreen',
      page: () => const Adduserscreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Forgetpasswordscreen',
      page: () => const Forgetpasswordscreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
    name: '/Admindashboard',
    page: () => const Admin_Dashboard(),
    transition: Transition.fadeIn,
  ),
  GetPage(
      name: '/AddWorkTypeScreen',
      page: () => const AddWorkTypeScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/FacilityAddListItems',
      page: () => const FacilityAddListItems(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/FacilitiesScreen',
      page: () => FacilitiesScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  // GetPage(
  //     name: '/FacilitiesListView',
  //     page: () => FacilitiesListView(
  //           containers: [],
  //         ),
  //     transition: Transition.fadeIn,
  //     binding: HomeBinding()),
  GetPage(
      name: '/Facilitydetails',
      page: () => Facilitydetails(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Piechartscreen',
      page: () => const Piechartscreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Punchinscreen',
      page: () => const Punchinscreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
    name: '/Punchoutscreen',
    page: () => const Punchoutscreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/Punchscreen',
    page: () => const Punchscreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/Settingsscreen',
    page: () => Settingsscreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
      name: '/ShiftTimeFromScreen',
      page: () => ShiftTimeFromScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Shifttimeviewscreen',
      page: () => Shifttimeviewscreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Siteheaddashboard',
      page: () => Siteheaddashboard(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Siteheadaddcontractorscreen',
      page: () => Siteheadaddcontractorscreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Adminaddreportmanagerscreen',
      page: () => Adminaddreportmanagerscreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Adminaddsiteheadscreen',
      page: () => Adminaddsiteheadscreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Siteheadaddsiteworkerscreen',
      page: () => Siteheadaddsiteworkerscreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Workerdetailsscreen',
      page: () => Workerdetailsscreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Workerlistscreen',
      page: () => Workerlistscreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Userdetailsscreen',
      page: () => Userdetailsscreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Addcontractoruserlist',
      page: () => Addcontractoruserlist(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Addreportuserlist',
      page: () => Addreportuserlist(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Addsiteheaderuser',
      page: () => Addsiteheaderuser(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/Userscreen',
      page: () => Userscreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/WorkTypeScreen',
      page: () => WorkTypeScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
  GetPage(
      name: '/SiteheadUser',
      page: () => SiteheadUser(),
      transition: Transition.fadeIn,
      binding: HomeBinding()),
];
