import 'package:ez_flutter/features/loans/domain/entity/note.dart';
import 'package:ez_flutter/shared/date_format_utils.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:flutter/material.dart';

class ChatItemWidget extends StatelessWidget {
  const ChatItemWidget({
    Key? key,
    required this.note,
  }) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    final createdByMe = note.createdByMe();

    return Container(
      decoration: BoxDecoration(
        color: createdByMe
            ? Theme.of(context).colorScheme.primary.withAlpha(50)
            : Colors.white,
        border: Border.all(color: AppColors.lightGrey),
        borderRadius: BorderRadius.only(
          topLeft:
              createdByMe ? const Radius.circular(8) : const Radius.circular(2),
          topRight:
              createdByMe ? const Radius.circular(2) : const Radius.circular(8),
          bottomLeft: createdByMe
              ? const Radius.circular(8)
              : const Radius.circular(32),
          bottomRight: createdByMe
              ? const Radius.circular(32)
              : const Radius.circular(8),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      margin: createdByMe
          ? const EdgeInsets.only(left: 64)
          : const EdgeInsets.only(right: 64.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.note,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 4),
          Text(
            '${createdByMe ? 'You' : note.createdBy} @${getFriendlyDate(note.createdAt)}',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
