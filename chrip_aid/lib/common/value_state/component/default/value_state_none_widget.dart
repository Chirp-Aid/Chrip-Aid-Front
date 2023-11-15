import 'package:chrip_aid/common/styles/colors.dart';
import 'package:chrip_aid/common/value_state/state/value_state.dart';
import 'package:flutter/material.dart';

import '../value_state_notifier_widget.dart';

class ValueStateNoneWidget<T> extends StatelessWidget
    implements ValueStateNotifierWidget {
  @override
  final ValueStateNotifier<T> state;

  ValueStateNoneWidget(this.state, {Key? key})
      : assert(state.isError),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: CustomColor.contentSubColor);
  }
}
