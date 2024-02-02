import 'package:go_router/go_router.dart';

extension MaybePopExtentsion on GoRouter {
  void maybePop() {
    if (canPop()) {
      return pop();
    }
  }
}
