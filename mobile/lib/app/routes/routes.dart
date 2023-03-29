import 'package:mobile/app/view/unassigned_page.dart';
import 'package:mobile/home_overview/bloc/home_overview_bloc.dart';
import 'package:mobile/home_overview/view/home_overview.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/app/app.dart';
import 'package:mobile/login/login.dart';

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
