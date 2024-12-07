// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

// ignore_for_file: public_member_api_docs

import 'package:gg_cache/gg_cache.dart';
import 'package:test/test.dart';

void main() {
  group('Cache', () {
    // #########################################################################

    test('should work for selected cases', () {
      final cache = Cache<String>();
      var counter = 0;

      // First time generate should be called
      var value = cache.cache(['key'], () {
        counter++;
        return 'first run';
      });

      expect(value, 'first run');
      expect(counter, 1);

      // Second time with the same key, the cached value should be returned
      value = cache.cache(['key'], () {
        counter++;
        return 'first run';
      });
      expect(value, 'first run');
      expect(counter, 1);

      // Third time with the a different key, a new cache should be created
      value = cache.cache(['key0'], () {
        counter++;
        return 'second run';
      });
      expect(value, 'second run');
      expect(counter, 2);
    });
  });
}
