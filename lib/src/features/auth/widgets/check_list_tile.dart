import 'package:abiola_along_client_app/src/widgets/inter_tight_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../const/colors.dart';

class CheckListTileWidget extends ConsumerStatefulWidget {
  const CheckListTileWidget({
    super.key,
    this.text = 'Remember me',
    required this.onChanged,
    required this.value,
  });

  final String text;
  final void Function(bool?) onChanged;
  final bool value;

  @override
  ConsumerState createState() => _CheckListTileWidgetState();
}

class _CheckListTileWidgetState extends ConsumerState<CheckListTileWidget> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          side: BorderSide(
            color: Color(0xff6C7278),
            width: 1.5,
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.5),
          ),
          value: _value,
          onChanged: (value) {
            _value = value!;
            setState(() {});
            widget.onChanged(value);
          },
          activeColor: AppColors.greenPrimary,
        ),
        // 10.width,
        Expanded(
          child: InterTightText(
            widget.text,
            size: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.greyPrimary,
          ),
        ),
      ],
    );
  }
}
