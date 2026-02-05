// Smoke test: verifies the app compiles and key exports are accessible.

import 'package:flutter_test/flutter_test.dart';

import 'package:violeta/main.dart';

void main() {
  test('App compiles and MyApp can be instantiated', () {
    // Verify that MyApp can be constructed without errors.
    // We don't pump it since it requires Supabase initialization
    // and auth streams that are not available in the test environment.
    final widget = MyApp();
    expect(widget, isNotNull);
  });
}
