import 'package:ez_flutter/features/loans/presentation/bloc/add_note/add_note_cubit.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBottomBar extends StatefulWidget {
  const ChatBottomBar({
    Key? key,
    required this.loanId,
  }) : super(key: key);

  final String loanId;

  @override
  State<ChatBottomBar> createState() => _ChatBottomBarState();
}

class _ChatBottomBarState extends State<ChatBottomBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: AppColors.lightGrey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: AppColors.lightGrey,
                  ),
                ),
                contentPadding: const EdgeInsets.all(16.0),
                hintText: 'Start typing...',
                fillColor: Colors.white,
              ),
              minLines: 1,
              maxLines: 6,
              autocorrect: false,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.lightGrey,
              ),
              borderRadius: BorderRadius.circular(8.0),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (ctx, state) {
                bool shouldDisable = false;

                state.maybeWhen(
                  loading: () {
                    shouldDisable = true;
                  },
                  orElse: () {},
                );

                return IconButton(
                  color: shouldDisable ? Colors.grey : Theme.of(context).colorScheme.primary,
                  onPressed: shouldDisable
                      ? null
                      : () {
                          BlocProvider.of<AddNoteCubit>(context).addNote(
                              widget.loanId, _controller.text.toString());
                          _controller.clear();
                        },
                  icon: shouldDisable
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Icon(
                          FeatherIcons.send,
                          color: shouldDisable ? Colors.grey : Colors.white,
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
