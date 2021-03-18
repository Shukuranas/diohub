// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i12;

import '../view/home/widgets/search_overlay.dart' as _i3;
import '../view/issues_pulls/issue_screen.dart' as _i10;
import '../view/issues_pulls/pull_screen.dart' as _i11;
import '../view/landing/widgets/landing_auth_wrapper.dart' as _i2;
import '../view/profile/other_user_profile_screen.dart' as _i9;
import '../view/repository/code/file_viewer.dart' as _i5;
import '../view/repository/commits/commit_info_screen.dart' as _i6;
import '../view/repository/commits/widgets/changes_viewer.dart' as _i8;
import '../view/repository/repository_screen.dart' as _i4;
import '../view/repository/wiki/wiki_viewer.dart' as _i7;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LandingAuthWrapperScreenRoute.name: (entry) {
      var args = entry.routeData.argsAs<LandingAuthWrapperScreenRouteArgs>(
          orElse: () => LandingAuthWrapperScreenRouteArgs());
      return _i1.CustomPage(
          entry: entry,
          child: _i2.LandingAuthWrapperScreen(key: args.key),
          maintainState: true,
          fullscreenDialog: false,
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    SearchOverlayScreenRoute.name: (entry) {
      return _i1.CustomPage(
          entry: entry,
          child: _i3.SearchOverlayScreen(),
          maintainState: true,
          fullscreenDialog: false,
          transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    RepositoryScreenRoute.name: (entry) {
      var args = entry.routeData.argsAs<RepositoryScreenRouteArgs>();
      return _i1.CustomPage(
          entry: entry,
          child: _i4.RepositoryScreen(args.repositoryURL,
              branch: args.branch,
              index: args.index,
              key: args.key,
              initSHA: args.initSHA),
          maintainState: true,
          fullscreenDialog: false,
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    FileViewerAPIRoute.name: (entry) {
      var args = entry.routeData.argsAs<FileViewerAPIRouteArgs>();
      return _i1.CustomPage(
          entry: entry,
          child: _i5.FileViewerAPI(args.sha,
              repoURL: args.repoURL,
              fileName: args.fileName,
              branch: args.branch,
              repoName: args.repoName),
          maintainState: true,
          fullscreenDialog: false,
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    CommitInfoScreenRoute.name: (entry) {
      var args = entry.routeData.argsAs<CommitInfoScreenRouteArgs>(
          orElse: () => CommitInfoScreenRouteArgs());
      return _i1.CustomPage(
          entry: entry,
          child: _i6.CommitInfoScreen(key: args.key, commitURL: args.commitURL),
          maintainState: true,
          fullscreenDialog: false,
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    WikiViewerRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<WikiViewerRouteArgs>(orElse: () => WikiViewerRouteArgs());
      return _i1.CustomPage(
          entry: entry,
          child: _i7.WikiViewer(key: args.key, repoURL: args.repoURL),
          maintainState: true,
          fullscreenDialog: false,
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    ChangesViewerRoute.name: (entry) {
      var args = entry.routeData.argsAs<ChangesViewerRouteArgs>();
      return _i1.CustomPage(
          entry: entry,
          child: _i8.ChangesViewer(args.patch, args.contentURL, args.fileType),
          maintainState: true,
          fullscreenDialog: false,
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    OtherUserProfileScreenRoute.name: (entry) {
      var args = entry.routeData.argsAs<OtherUserProfileScreenRouteArgs>();
      return _i1.CustomPage(
          entry: entry,
          child: _i9.OtherUserProfileScreen(args.login),
          maintainState: true,
          fullscreenDialog: false,
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    IssueScreenRoute.name: (entry) {
      var args = entry.routeData.argsAs<IssueScreenRouteArgs>();
      return _i1.CustomPage(
          entry: entry,
          child: _i10.IssueScreen(args.issueURL, args.repoURL,
              initialIndex: args.initialIndex,
              commentsSince: args.commentsSince),
          maintainState: true,
          fullscreenDialog: false,
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    PullScreenRoute.name: (entry) {
      var args = entry.routeData.argsAs<PullScreenRouteArgs>();
      return _i1.CustomPage(
          entry: entry,
          child: _i11.PullScreen(args.pullURL,
              initialIndex: args.initialIndex,
              commentsSince: args.commentsSince),
          maintainState: true,
          fullscreenDialog: false,
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LandingAuthWrapperScreenRoute.name,
            path: '/', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(SearchOverlayScreenRoute.name,
            path: '/search-overlay-screen',
            fullMatch: false,
            usesTabsRouter: false),
        _i1.RouteConfig(RepositoryScreenRoute.name,
            path: '/repository-screen',
            fullMatch: false,
            usesTabsRouter: false),
        _i1.RouteConfig(FileViewerAPIRoute.name,
            path: '/file-viewer-ap-i', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(CommitInfoScreenRoute.name,
            path: '/commit-info-screen',
            fullMatch: false,
            usesTabsRouter: false),
        _i1.RouteConfig(WikiViewerRoute.name,
            path: '/wiki-viewer', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(ChangesViewerRoute.name,
            path: '/changes-viewer', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(OtherUserProfileScreenRoute.name,
            path: '/other-user-profile-screen',
            fullMatch: false,
            usesTabsRouter: false),
        _i1.RouteConfig(IssueScreenRoute.name,
            path: '/issue-screen', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(PullScreenRoute.name,
            path: '/pull-screen', fullMatch: false, usesTabsRouter: false)
      ];
}

class LandingAuthWrapperScreenRoute
    extends _i1.PageRouteInfo<LandingAuthWrapperScreenRouteArgs> {
  LandingAuthWrapperScreenRoute({this.key})
      : super(name,
            path: '/', args: LandingAuthWrapperScreenRouteArgs(key: key));

  final _i12.Key? key;

  static const String name = 'LandingAuthWrapperScreenRoute';
}

class LandingAuthWrapperScreenRouteArgs {
  const LandingAuthWrapperScreenRouteArgs({this.key});

  final _i12.Key? key;
}

class SearchOverlayScreenRoute extends _i1.PageRouteInfo {
  const SearchOverlayScreenRoute()
      : super(name, path: '/search-overlay-screen');

  static const String name = 'SearchOverlayScreenRoute';
}

class RepositoryScreenRoute
    extends _i1.PageRouteInfo<RepositoryScreenRouteArgs> {
  RepositoryScreenRoute(
      {this.repositoryURL, this.branch, this.index = 0, this.key, this.initSHA})
      : super(name,
            path: '/repository-screen',
            args: RepositoryScreenRouteArgs(
                repositoryURL: repositoryURL,
                branch: branch,
                index: index,
                key: key,
                initSHA: initSHA));

  final String? repositoryURL;

  final String? branch;

  final int index;

  final _i12.Key? key;

  final String? initSHA;

  static const String name = 'RepositoryScreenRoute';
}

class RepositoryScreenRouteArgs {
  const RepositoryScreenRouteArgs(
      {this.repositoryURL,
      this.branch,
      this.index = 0,
      this.key,
      this.initSHA});

  final String? repositoryURL;

  final String? branch;

  final int index;

  final _i12.Key? key;

  final String? initSHA;
}

class FileViewerAPIRoute extends _i1.PageRouteInfo<FileViewerAPIRouteArgs> {
  FileViewerAPIRoute(
      {this.sha, this.repoURL, this.fileName, this.branch, this.repoName})
      : super(name,
            path: '/file-viewer-ap-i',
            args: FileViewerAPIRouteArgs(
                sha: sha,
                repoURL: repoURL,
                fileName: fileName,
                branch: branch,
                repoName: repoName));

  final String? sha;

  final String? repoURL;

  final String? fileName;

  final String? branch;

  final String? repoName;

  static const String name = 'FileViewerAPIRoute';
}

class FileViewerAPIRouteArgs {
  const FileViewerAPIRouteArgs(
      {this.sha, this.repoURL, this.fileName, this.branch, this.repoName});

  final String? sha;

  final String? repoURL;

  final String? fileName;

  final String? branch;

  final String? repoName;
}

class CommitInfoScreenRoute
    extends _i1.PageRouteInfo<CommitInfoScreenRouteArgs> {
  CommitInfoScreenRoute({this.key, this.commitURL})
      : super(name,
            path: '/commit-info-screen',
            args: CommitInfoScreenRouteArgs(key: key, commitURL: commitURL));

  final _i12.Key? key;

  final String? commitURL;

  static const String name = 'CommitInfoScreenRoute';
}

class CommitInfoScreenRouteArgs {
  const CommitInfoScreenRouteArgs({this.key, this.commitURL});

  final _i12.Key? key;

  final String? commitURL;
}

class WikiViewerRoute extends _i1.PageRouteInfo<WikiViewerRouteArgs> {
  WikiViewerRoute({this.key, this.repoURL})
      : super(name,
            path: '/wiki-viewer',
            args: WikiViewerRouteArgs(key: key, repoURL: repoURL));

  final _i12.Key? key;

  final String? repoURL;

  static const String name = 'WikiViewerRoute';
}

class WikiViewerRouteArgs {
  const WikiViewerRouteArgs({this.key, this.repoURL});

  final _i12.Key? key;

  final String? repoURL;
}

class ChangesViewerRoute extends _i1.PageRouteInfo<ChangesViewerRouteArgs> {
  ChangesViewerRoute({this.patch, this.contentURL, this.fileType})
      : super(name,
            path: '/changes-viewer',
            args: ChangesViewerRouteArgs(
                patch: patch, contentURL: contentURL, fileType: fileType));

  final String? patch;

  final String? contentURL;

  final String? fileType;

  static const String name = 'ChangesViewerRoute';
}

class ChangesViewerRouteArgs {
  const ChangesViewerRouteArgs({this.patch, this.contentURL, this.fileType});

  final String? patch;

  final String? contentURL;

  final String? fileType;
}

class OtherUserProfileScreenRoute
    extends _i1.PageRouteInfo<OtherUserProfileScreenRouteArgs> {
  OtherUserProfileScreenRoute({this.login})
      : super(name,
            path: '/other-user-profile-screen',
            args: OtherUserProfileScreenRouteArgs(login: login));

  final String? login;

  static const String name = 'OtherUserProfileScreenRoute';
}

class OtherUserProfileScreenRouteArgs {
  const OtherUserProfileScreenRouteArgs({this.login});

  final String? login;
}

class IssueScreenRoute extends _i1.PageRouteInfo<IssueScreenRouteArgs> {
  IssueScreenRoute(
      {this.issueURL, this.repoURL, this.initialIndex = 0, this.commentsSince})
      : super(name,
            path: '/issue-screen',
            args: IssueScreenRouteArgs(
                issueURL: issueURL,
                repoURL: repoURL,
                initialIndex: initialIndex,
                commentsSince: commentsSince));

  final String? issueURL;

  final String? repoURL;

  final int initialIndex;

  final DateTime? commentsSince;

  static const String name = 'IssueScreenRoute';
}

class IssueScreenRouteArgs {
  const IssueScreenRouteArgs(
      {this.issueURL, this.repoURL, this.initialIndex = 0, this.commentsSince});

  final String? issueURL;

  final String? repoURL;

  final int initialIndex;

  final DateTime? commentsSince;
}

class PullScreenRoute extends _i1.PageRouteInfo<PullScreenRouteArgs> {
  PullScreenRoute({this.pullURL, this.initialIndex = 0, this.commentsSince})
      : super(name,
            path: '/pull-screen',
            args: PullScreenRouteArgs(
                pullURL: pullURL,
                initialIndex: initialIndex,
                commentsSince: commentsSince));

  final String? pullURL;

  final int initialIndex;

  final DateTime? commentsSince;

  static const String name = 'PullScreenRoute';
}

class PullScreenRouteArgs {
  const PullScreenRouteArgs(
      {this.pullURL, this.initialIndex = 0, this.commentsSince});

  final String? pullURL;

  final int initialIndex;

  final DateTime? commentsSince;
}
