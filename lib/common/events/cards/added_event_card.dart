import 'package:dio_hub/common/events/cards/base_card.dart';
import 'package:dio_hub/common/misc/profile_card.dart';
import 'package:dio_hub/common/misc/repository_card.dart';
import 'package:dio_hub/models/events/events_model.dart' hide Key;
import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddedEventCard extends StatelessWidget {
  final EventsModel event;
  final String eventTextMiddle;
  final RepositoryModel? repo;
  final String? branch;
  const AddedEventCard(this.event, this.eventTextMiddle,
      {this.branch, this.repo, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseEventCard(
      actor: event.actor!.login,
      headerText: [
        TextSpan(text: ' $eventTextMiddle '),
        TextSpan(
          text: event.repo!.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
      userLogin: event.actor!.login,
      date: event.createdAt,
      avatarUrl: event.actor!.avatarUrl,
      childPadding: EdgeInsets.zero,
      child: Container(
        color: AppColor.onBackground,
        child: Column(
          children: [
            ProfileCard(
              event.payload.member,
              compact: true,
            ),
            const SizedBox(
              height: 8,
            ),
            RepoCardLoading(
              repo != null ? repo!.url : event.repo!.url,
              repo != null ? repo!.name : event.repo!.name,
              elevation: 0,
              branch: branch,
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}
