// @license
// Copyright (c) 2019 - 2024 Dr. Gabriel Gatzsche. All Rights Reserved.
//
// Use of this source code is governed by terms that can be
// found in the LICENSE file in the root of this package.

// ignore_for_file: public_member_api_docs

import 'package:gg_list/gg_list.dart';

/// Implements a cache
class Cache<T> {
  /// The constructor
  Cache();

  // ...........................................................................
  /// Caches a generated value for a key
  T cache(Iterable<Object> keys, T Function() generate) {
    // Generate hashcode
    var hashCode = keys is GgList ? keys.hashCode : fnv1(keys);

    // Return existing item when possible
    final existingItem = _cache[hashCode];
    if (existingItem != null) {
      return existingItem;
    }

    // Create new item when needed
    final result = generate();
    _cache[hashCode] = result;

    // Return result
    return result;
  }

  // ...........................................................................
  final Map<int, T> _cache = {};
}
