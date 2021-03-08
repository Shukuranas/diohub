import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:onehub/common/api_wrapper_widget.dart';
import 'package:onehub/models/repositories/blob_model.dart';
import 'package:onehub/services/git_database/blobs_service.dart';
import 'package:onehub/style/colors.dart';

class FileViewerAPI extends StatefulWidget {
  final String repoURL;
  final String fileName;
  final String sha;
  FileViewerAPI(this.sha, {this.repoURL, this.fileName});

  @override
  _FileViewerAPIState createState() => _FileViewerAPIState();
}

class _FileViewerAPIState extends State<FileViewerAPI> {
  final ContentViewController contentViewController = ContentViewController();

  bool wrapText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: Text(
          widget.fileName,
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.wrap_text,
              color: wrapText ? AppColor.accent : Colors.white,
            ),
            onPressed: () {
              setState(() {
                wrapText = contentViewController.wrap();
              });
            },
          ),
        ],
      ),
      body: APIWrapper<BlobModel>(
        apiCall: GitDatabaseService.getBlob(
            sha: widget.sha, repoURL: widget.repoURL),
        responseBuilder: (context, blob) {
          return ContentViewer(
            blob,
            widget.fileName,
            contentViewController: contentViewController,
          );
        },
      ),
    );
  }
}

class ContentViewController {
  bool Function() wrap;
}

class ContentViewer extends StatefulWidget {
  final BlobModel blob;
  final String fileName;
  final ContentViewController contentViewController;
  ContentViewer(this.blob, this.fileName, {this.contentViewController});
  @override
  _ContentViewerState createState() =>
      _ContentViewerState(contentViewController);
}

class _ContentViewerState extends State<ContentViewer> {
  _ContentViewerState(ContentViewController contentViewController) {
    if (contentViewController != null) contentViewController.wrap = changeWrap;
  }

  bool loading = true;
  List<String> content;
  bool wrapText = false;
  int numberOfMaxChars = 0;
  @override
  void initState() {
    content = parse();
    super.initState();
  }

  bool changeWrap() {
    setState(() {
      wrapText = !wrapText;
    });
    return wrapText;
  }

  List<String> parse() {
    String temp = widget.blob.content;
    List<String> listTemp = temp.split('\n');
    listTemp = listTemp.map((e) {
      try {
        return utf8.decode(base64.decode(e));
      } catch (e) {
        print(e);
        return '';
      }
    }).toList();
    setState(() {
      loading = false;
    });
    listTemp = listTemp.join().split('\n');
    for (String string in listTemp) {
      if (string.length > numberOfMaxChars) numberOfMaxChars = string.length;
    }
    return listTemp;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: wrapText
              ? MediaQuery.of(context).size.width
              : numberOfMaxChars.toDouble() * 10,
          child: ListView.builder(
              itemCount: content.length,
              itemBuilder: (context, index) {
                return Container(
                  color: index % 2 == 0
                      ? AppColor.background
                      : AppColor.onBackground,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          index.toString(),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Flexible(
                          child: HighlightView(
                            content[index],
                            backgroundColor: Colors.transparent,
                            theme: monokaiSublimeTheme,
                            language: widget.fileName.split('.').last,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}