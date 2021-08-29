import 'package:flutter/material.dart';
import 'package:habllen/ui/new_invoice_page/cubit/new_invoice_cubit.dart';
import 'package:habllen/ui/new_invoice_page/screen1.dart';
import 'package:habllen/ui/new_invoice_page/screen2.dart';
import 'package:habllen/ui/new_invoice_page/screen3.dart';

List<Page> onGenerateRoute(ScreenStage state, List<Page> pages) {
  switch (state) {
    case ScreenStage.stage1:
      return [Screen1.page()];
    case ScreenStage.stage2:
      return [Screen1.page(), Screen2.page()];
    case ScreenStage.stage3:
      return [Screen1.page(), Screen2.page(), Screen3.page()];
    default:
      return [Screen1.page()];
  }
}
