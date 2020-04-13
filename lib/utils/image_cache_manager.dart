import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// A custom cache manager to be used with [CachedNetworkImage]
///
/// This method helps to pre-cache the images in memory
class ImageCacheManager extends BaseCacheManager {
  static const key = "CovidImageCache";

  // Instantiating the class
  static ImageCacheManager _instance;

  // Factory function is used to return the instance of the class
  factory ImageCacheManager() {
    // Using dart's Null-aware operator to assign the value only if null
    return _instance ??= ImageCacheManager._();
  }

  // Overriding the method by BaseCacheManager to set parameters such as
  // cache key, cache age, max cache objects
  ImageCacheManager._()
      : super(
          key,
          maxAgeCacheObject: const Duration(days: 7),
          maxNrOfCacheObjects: 20,
          fileFetcher: _customHttpGetter,
        );

  // Overriding the method by BaseCacheManager to user the Temporary Director
  @override
  Future<String> getFilePath() async {
    final directory = await getTemporaryDirectory();
    return p.join(directory.path, key);
  }

  // Fetching the images using the provided URLs
  static Future<FileFetcherResponse> _customHttpGetter(String url,
      {Map<String, String> headers}) async {
    return HttpFileFetcherResponse(await http.get(url, headers: headers));
  }
}
