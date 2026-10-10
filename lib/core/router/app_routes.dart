abstract final class AppRoutes {
  static const home = '/';
  static const confirmation = '/confirmation';
  static const history = '/history';
  static const profits = '/profits';
  static const nodes = '/nodes';
  static const creditor = '/nodes/creditors/:creditorId';
  static const receipts = '/receipts';
  static const settings = '/settings';

  static String creditorPath(String creditorId) =>
      '/nodes/creditors/$creditorId';
}
