import 'package:get/get.dart';
import 'package:saptapti/Controller/getMatchesController.dart';
import 'package:saptapti/Controller/loginController.dart';

import 'Controller/regiser3Controller.dart';
import 'Controller/register2Controller.dart';
import 'Controller/register4Controller.dart';
import 'Controller/registerController.dart';
import 'Controller/userHomeController.dart';

class StoreBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => GetMatchesController());
    Get.lazyPut(() => registerController());
    Get.lazyPut(() => Register2Controller());
    Get.lazyPut(() => Register3Controller());
    Get.lazyPut(() => Register4Controller());
    Get.lazyPut(() => UserHomeController());
  }
}
