import 'package:flutter/material.dart';

import 'route_path.dart';

class MyRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');
    // Handle '/'
    if (uri.pathSegments.length == 0) {
      return RoutePath.home();
    }

    // Handle '/book/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'book') return RoutePath.unknown();
      var remaining = uri.pathSegments[1];
      var id = int.tryParse(remaining);
      if (id == null) return RoutePath.unknown();
      return RoutePath.details(id);
    }

    // Handle unknown routes
    return RoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(RoutePath path) {
    if (path.isUnknown) {
      return const RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return const RouteInformation(location: '/');
    }
    if (path.isDetailsPage) {
      return RouteInformation(location: '/book/${path.id}');
    }
    return const RouteInformation(location: '/');
  }
}
