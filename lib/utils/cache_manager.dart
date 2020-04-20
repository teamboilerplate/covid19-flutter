import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// A custom cache manager to be used with [CachedNetworkImage]
///
/// This method helps to pre-cache the images in memory
class CacheManager extends BaseCacheManager {
  static const key = "CovidCache";

  // Instantiating the class
  static CacheManager _instance;

  // Factory function is used to return the instance of the class
  factory CacheManager() {
    // Using dart's Null-aware operator to assign the value only if null
    return _instance ??= CacheManager._();
  }

  // Overriding the method by BaseCacheManager to set parameters such as
  // cache key, cache age, max cache objects
  CacheManager._()
      : super(
          key,
          maxAgeCacheObject: const Duration(days: 1),
          maxNrOfCacheObjects: 20,
        );

  // Overriding the method by BaseCacheManager to user the Temporary Director
  @override
  Future<String> getFilePath() async {
    final directory = await getTemporaryDirectory();
    return p.join(directory.path, key);
  }
}
