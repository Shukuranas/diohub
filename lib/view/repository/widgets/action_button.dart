import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActionButton extends StatefulWidget {
  const ActionButton(
      {Key? key,
      this.count,
      this.action,
      this.doneColor,
      this.onTap,
      this.icon,
      this.isDone = false})
      : super(key: key);
  final int? count;
  final IconData? icon;
  final VoidCallback? onTap;
  final String? action;
  final bool? isDone;
  final Color? doneColor;

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Button(
      listenToLoadingController: false,
      stretch: false,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: Provider.of<PaletteSettings>(context).currentSetting.secondary,
      onTap: widget.onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.isDone != null
              ? Icon(
                  widget.icon,
                  color: widget.isDone!
                      ? widget.doneColor
                      : Provider.of<PaletteSettings>(context)
                          .currentSetting
                          .faded3,
                  size: 15,
                )
              : ShimmerWidget(
                  child: Icon(
                    widget.icon,
                    size: 15,
                  ),
                ),
          if (widget.count != null)
            SizeExpandedSection(
              axis: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8),
                  //   child: Container(
                  //     width: 1,
                  //     height: 15,
                  //     color: Provider.of<PaletteSettings>(context)
                  //         .currentSetting
                  //         .faded3,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   width: 4,
                  // ),
                  Text(
                    widget.count! > 999
                        ? '${(widget.count! / 1000).toStringAsFixed(1)}k'
                        : widget.count.toString(),
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  if (widget.action != null)
                    Text(
                      ' ${widget.action!}',
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
