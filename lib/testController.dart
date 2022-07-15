import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class TestController extends GetxController {
  RxDouble videoSize = 0.0.obs;
  RxBool isSize = false.obs;
}
