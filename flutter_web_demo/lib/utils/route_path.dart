///@Description TODO
///@Author jd
class RoutePath {
  final int id;
  final bool isUnknown;

  RoutePath.home()
      : id = 0,
        isUnknown = false;

  RoutePath.details(this.id) : isUnknown = false;

  RoutePath.unknown()
      : id = 0,
        isUnknown = true;

  bool get isHomePage => id == 0;

  bool get isDetailsPage => id != 0;
}
