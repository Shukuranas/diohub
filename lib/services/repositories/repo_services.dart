import 'package:dio/dio.dart';
import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/repositories/branch_list_model.dart';
import 'package:onehub/models/repositories/branch_model.dart';
import 'package:onehub/models/repositories/readme_model.dart';
import 'package:onehub/models/repositories/repository_model.dart';

class RepositoryServices {
  // Ref: https://docs.github.com/en/rest/reference/repos#get-a-repository
  static Future<RepositoryModel> fetchRepository(String url) async {
    Response response = await GetDio.getDio(applyBaseURL: false)
        .get(url, options: CacheManager.repositories());
    return RepositoryModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#get-a-repository-readme
  static Future<RepositoryReadmeModel> fetchReadme(String repoUrl,
      {String branch}) async {
    Response response = await GetDio.getDio(applyBaseURL: false).get(
        repoUrl + '/readme',
        options: CacheManager.defaultCache(),
        queryParameters: {'ref': branch});
    return RepositoryReadmeModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#get-a-branch
  static Future<BranchModel> fetchBranch(String branchUrl) async {
    Response response = await GetDio.getDio(applyBaseURL: false)
        .get(branchUrl, options: CacheManager.defaultCache());
    return BranchModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#list-branches
  static Future<List<RepoBranchListItemModel>> fetchBranchList(
      String repoURL, int pageNumber, int perPage,
      [bool refresh = false]) async {
    Response response = await GetDio.getDio(applyBaseURL: false).get(
        '$repoURL/branches',
        options: CacheManager.defaultCache(refresh),
        queryParameters: {'per_page': perPage, 'page': pageNumber});
    List unParseData = response.data;
    List<RepoBranchListItemModel> parsedData = [];
    for (var item in unParseData) {
      parsedData.add(RepoBranchListItemModel.fromJson(item));
    }
    return parsedData;
  }
}