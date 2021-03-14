import 'package:flutter/material.dart';
import 'package:onehub/common/api_wrapper_widget.dart';
import 'package:onehub/common/bottom_sheet.dart';
import 'package:onehub/common/info_card.dart';
import 'package:onehub/common/issues/issue_label.dart';
import 'package:onehub/common/markdown_body.dart';
import 'package:onehub/common/profile_banner.dart';
import 'package:onehub/providers/issue/issue_provider.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/get_date.dart';
import 'package:onehub/view/issues_pulls/widgets/assignee_select_sheet.dart';
import 'package:onehub/view/issues_pulls/widgets/label_select_sheet.dart';
import 'package:provider/provider.dart';

class IssueInformation extends StatelessWidget {
  final APIWrapperController labelController = APIWrapperController();
  IssueInformation();
  @override
  Widget build(BuildContext context) {
    final _issue = Provider.of<IssueProvider>(context).issueModel;
    final _editingEnabled = Provider.of<IssueProvider>(context).editingEnabled;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          InfoCard(
            'Title',
            child: Row(
              children: [
                Flexible(child: Text(_issue.title)),
              ],
            ),
          ),
          InfoCard(
            'Assignees',
            headerTrailing: _editingEnabled
                ? Text(
                    'EDIT',
                    style: TextStyle(color: AppColor.grey3, fontSize: 12),
                  )
                : null,
            onTap: _editingEnabled
                ? () {
                    showScrollableBottomActionsMenu(
                      context,
                      titleText: 'Select Assignees',
                      child: (sheetContext, scrollController) {
                        return AssigneeSelectSheet(
                          controller: scrollController,
                          repoURL: _issue.repositoryUrl,
                          issueUrl: _issue.url,
                          assignees: _issue.assignees,
                          newAssignees: (assignees) {
                            // Provider.of<IssueProvider>(context, listen: false)
                            //     .updateLabels(labels);
                          },
                        );
                      },
                    );
                  }
                : null,
            child: Consumer<IssueProvider>(
              builder: (context, value, _) {
                return Row(
                  children: [
                    value.issueModel.assignees.isNotEmpty
                        ? Flexible(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                value.issueModel.assignees.length,
                                (index) => ProfileTile(
                                      value.issueModel.assignees[index]
                                          .avatarUrl,
                                      userLogin: value
                                          .issueModel.assignees[index].login,
                                      padding: EdgeInsets.all(8),
                                      showName: true,
                                    )),
                          ))
                        : Text('No assignees.'),
                  ],
                );
              },
            ),
          ),
          InfoCard(
            'Labels',
            headerTrailing: _editingEnabled
                ? Text(
                    'EDIT',
                    style: TextStyle(color: AppColor.grey3, fontSize: 12),
                  )
                : null,
            onTap: _editingEnabled
                ? () {
                    showScrollableBottomActionsMenu(
                      context,
                      titleText: 'Select Labels',
                      child: (sheetContext, scrollController) {
                        return LabelSelectSheet(
                          controller: scrollController,
                          repoURL: _issue.repositoryUrl,
                          issueUrl: _issue.url,
                          labels: _issue.labels,
                          newLabels: (labels) {
                            Provider.of<IssueProvider>(context, listen: false)
                                .updateLabels(labels);
                          },
                        );
                      },
                    );
                  }
                : null,
            child: Consumer<IssueProvider>(
              builder: (context, issue, _) {
                var _issue = issue.issueModel;
                return Row(
                  children: [
                    (_issue.labels.isNotEmpty)
                        ? Flexible(
                            child: Wrap(
                              children: List.generate(
                                  _issue.labels.length,
                                  (index) => Padding(
                                        padding: const EdgeInsets.only(
                                            right: 4, bottom: 8),
                                        child: IssueLabel(_issue.labels[index]),
                                      )),
                            ),
                          )
                        : Text("No labels."),
                  ],
                );
              },
            ),
          ),
          InfoCard(
            'Description',
            child: Row(
              children: [
                Flexible(
                    child: _issue.body.isEmpty
                        ? Text('No description provided.')
                        : ExpansionTile(
                            title: Text('Tap to Expand'),
                            children: [MarkdownBody(_issue.body)],
                          )),
              ],
            ),
          ),
          InfoCard(
            'Created By',
            child: Row(
              children: [
                Flexible(
                  child: ProfileTile(
                    _issue.user.avatarUrl,
                    padding: EdgeInsets.all(8),
                    userLogin: _issue.user.login,
                    showName: true,
                  ),
                ),
              ],
            ),
          ),
          InfoCard(
            'Created At',
            child: Row(
              children: [
                Text(getDate(_issue.createdAt.toString(), shorten: false)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}