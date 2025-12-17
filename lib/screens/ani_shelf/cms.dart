
import 'package:cms/cms.dart';

import 's.dart';
import 'a.dart';

export 's.dart';
export 'a.dart';

class M extends Cms<S, A> {
  M() : super(const Zero()) ;
  @override
  Future<S> kernel(S s, A a) async => switch ((s, a)) {
    _ => undefined(s, a),
  };
}
