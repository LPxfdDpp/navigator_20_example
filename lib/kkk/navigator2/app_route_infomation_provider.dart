import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigator_example/kkk/navigator2/app_path.dart';

class AppRouteInformationProvider extends RouteInformationProvider with WidgetsBindingObserver, ChangeNotifier {
  /// Create a platform route information provider.
  ///
  /// Use the [initialRouteInformation] to set the default route information for this
  /// provider.
  AppRouteInformationProvider({
    RouteInformation? initialRouteInformation
  }) : _value = initialRouteInformation;

  @override
  void routerReportsNewRouteInformation(RouteInformation routeInformation) {
    SystemNavigator.routeInformationUpdated(
      location: routeInformation.location!,
      state: routeInformation.state,
    );
    _value = routeInformation;
  }

  @override
  RouteInformation? get value => _value;
  RouteInformation? _value;

  void _platformReportsNewRouteInformation(RouteInformation routeInformation) {
    if (_value == routeInformation)
      return;
    _value = routeInformation;
    notifyListeners();
  }

  @override
  void addListener(VoidCallback listener) {
    if (!hasListeners)
      WidgetsBinding.instance!.addObserver(this);
    super.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    super.removeListener(listener);
    if (!hasListeners)
      WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  void dispose() {
    // In practice, this will rarely be called. We assume that the listeners
    // will be added and removed in a coherent fashion such that when the object
    // is no longer being used, there's no listener, and so it will get garbage
    // collected.
    if (hasListeners)
      WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) async {

    // final information = RouteInformation(
    //     location: routeInformation.location,
    //     state: {AppPath.APAT:DateTime.now().millisecondsSinceEpoch}
    // );

    assert(hasListeners);
    _platformReportsNewRouteInformation(routeInformation);
    return true;
  }

  @override
  Future<bool> didPushRoute(String route) async {
    assert(hasListeners);
    _platformReportsNewRouteInformation(RouteInformation(location: route));
    return true;
  }
}