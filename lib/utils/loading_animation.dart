import 'package:flutter_easyloading/flutter_easyloading.dart';

void showLoadingAnimation() {
  EasyLoading.instance.maskType = EasyLoadingMaskType.black;
  EasyLoading.show(status: "Please wait..");
}

void closeLoadingAnimation() {
  EasyLoading.dismiss();
}
