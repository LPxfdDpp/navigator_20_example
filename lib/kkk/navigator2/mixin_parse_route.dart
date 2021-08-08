import 'package:navigator_example/kkk/navigator2/app_path.dart';

mixin ParseRoute {

  BaseAppPathAndInfo parseRoute(Uri uri) {
    // Handle '/'
    if (uri.pathSegments.isEmpty) {
      return HomeAppPathAndInfo();
    }

    if (uri.pathSegments.length == 2) {
      // Handle '/details/:id'
      if(uri.path.contains('details')){
        if (uri.pathSegments[0] != 'details') return UnknownAppPathAndInfo();
        var remaining = uri.pathSegments[1];
        var id = int.tryParse(remaining);
        if (id == null) return UnknownAppPathAndInfo();
        return DetailAppPathAndInfo(id);
      }else if(uri.path.contains('tabs')){
        if (uri.pathSegments[0] != 'tabs') return UnknownAppPathAndInfo();
        var remaining = uri.pathSegments[1];
        var index = int.tryParse(remaining);
        if (index == null) return UnknownAppPathAndInfo();
        return TabAppPathAndInfo(index);
      }

    }

    // Handle unknown routes
    return UnknownAppPathAndInfo();
  }

}