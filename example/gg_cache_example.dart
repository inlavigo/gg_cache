import 'package:gg_cache/gg_cache.dart';

/// A simple class
class Foo {
  const Foo({required this.a, required this.b});
  final int a;
  final int b;
}

/// Create a cache
final cache = Cache<Foo>();

/// Create a method that creates Foos
Foo createFoo(int a, int b) {
  return cache.cache([a, b], () => Foo(a: a, b: b));
}

void main() {
  /// Crete three objects
  final a0 = createFoo(1, 2);
  final a1 = createFoo(1, 2);
  final b2 = createFoo(1, 3);

  /// a0 and a1 are identical because they take the same keys
  assert(identical(a0, a1));

  /// a0 and b2 are not identical because they take different keys
  assert(!identical(a0, b2));
}
