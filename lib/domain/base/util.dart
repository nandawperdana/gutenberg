import 'package:gutenberg/data/base/remote/response/base_response.dart';

extension PageUtil on BaseResponse {
  int getNextPage() {
    if (next == null) return 0;
    final uri = Uri.parse(next ?? '');
    final pageValue = uri.queryParameters['page'];

    return pageValue != null ? int.parse(pageValue) : 0;
  }
}
