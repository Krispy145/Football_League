import 'package:football_league/services/api_service.dart';
import 'package:football_league/services/navigation_service.dart' as nav;
import 'package:football_league/views/home_page/home_page_view.dart';
import 'package:football_league/views/settings_page/settings_page_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

///In order to generate the appropriate routing for the app, everytime there is a new route added [AppSetup] in this document, there must be a re-run of the command: flutter pub run build_runner build

@StackedApp(routes: [
  MaterialRoute(page: HomePageView, initial: true),
  MaterialRoute(page: SettingsView),
], dependencies: [
  ///Accessing the required services through a third-party service (stack_services)
  LazySingleton(classType: nav.NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: APIService),
])
class AppSetup {
  /** Serves no purpose besides having annotation attached to it */
}
