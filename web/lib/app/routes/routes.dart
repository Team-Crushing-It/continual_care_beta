import 'package:continual_care_beta_web/home/view/home_page.dart';
import 'package:flutter/widgets.dart';
import 'package:continual_care_beta_web/app/app.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];

    case AppStatus.unauthenticated:
      return [HomePage.page()];
  }
}
