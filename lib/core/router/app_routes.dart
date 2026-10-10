abstract final class AppRoutes {
  static const home = '/';
  static const confirmation = '/confirmation';
  static const history = '/history';
  static const profits = '/profits';
  static const nodes = '/nodes';
  static const creditor = 'creditors/:creditorId';
  static const receipts = '/receipts';
  static const settings = '/settings';

  static const transcriptParameter = 'text';
  static const creditorIdParameter = 'creditorId';

  static String confirmationPath([String? transcript]) => Uri(
    path: confirmation,
    queryParameters: transcript == null || transcript.isEmpty
        ? null
        : {transcriptParameter: transcript},
  ).toString();

  static String creditorPath(String creditorId) =>
      '$nodes/creditors/${Uri.encodeComponent(creditorId)}';
}
