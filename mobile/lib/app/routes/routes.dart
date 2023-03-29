import 'package:continual_care_beta/app/view/unassigned_page.dart';
import 'package:continual_care_beta/home_overview/view/home_overview.dart';
import 'package:flutter/widgets.dart';
import 'package:continual_care_beta/app/app.dart';
import 'package:continual_care_beta/login/login.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [LoadingPage.page()];
    case AppStatus.initialized:
      return [LoadingPage.page()];

    case AppStatus.unauthenticated:
      return [LoginPage.page()];

    case AppStatus.unassigned:
      return [UnassignedPage.page()];

    case AppStatus.assigned:
      return [HomeOverviewPage.page()];
  }
}
