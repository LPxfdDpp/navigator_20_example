abstract class BaseAppPathAndInfo{}


class HomeAppPathAndInfo extends BaseAppPathAndInfo {}

class DetailAppPathAndInfo extends BaseAppPathAndInfo {

  final int id;

  DetailAppPathAndInfo(this.id);

}
class UnknownAppPathAndInfo extends BaseAppPathAndInfo {}

class TabAppPathAndInfo extends BaseAppPathAndInfo {

  final int index;

  TabAppPathAndInfo(this.index);

}

