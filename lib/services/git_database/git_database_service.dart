import 'package:dio/dio.dart';
import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/repositories/blob_model.dart';
import 'package:onehub/models/repositories/code_tree_model.dart';
import 'package:onehub/models/repositories/commit_model.dart';

class GitDatabaseService {
  // Ref: https://docs.github.com/en/rest/reference/git#get-a-tree
  static Future<CodeTreeModel> getTree({String repoURL, String sha}) async {
    Response response = await GetDio.getDio(applyBaseURL: false)
        .get('$repoURL/git/trees/$sha', options: CacheManager.defaultCache());
    return CodeTreeModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/git#get-a-blob
  static Future<BlobModel> getBlob({String repoURL, String sha}) async {
    Response response = await GetDio.getDio(applyBaseURL: false)
        .get('$repoURL/git/blobs/$sha', options: CacheManager.defaultCache());
    return BlobModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#list-commits
  static Future<List<CommitModel>> getCommitsList(
      {String repoURL,
      String path,
      String sha,
      int pageNumber,
      int pageSize,
      String author,
      bool refresh = false}) async {
    Map<String, dynamic> queryParams = {
      'path': path,
      'per_page': pageSize,
      'page': pageNumber,
      'sha': sha
    };
    if (author != null) queryParams['author'] = author;
    Response response = await GetDio.getDio(applyBaseURL: false).get(
        repoURL + '/commits',
        queryParameters: queryParams,
        options: CacheManager.defaultCache(refresh));
    List unParsedItems = response.data;
    List<CommitModel> parsedItems = [];
    for (var element in unParsedItems) {
      parsedItems.add(CommitModel.fromJson(element));
    }
    return parsedItems;
  }
}