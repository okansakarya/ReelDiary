import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state/connectivity/connectivity_cubit.dart';
import '../../state/connectivity/connectivity_state.dart';
import 'no_internet_popup_widget.dart';

class ConnectivityOverlayWidget extends StatelessWidget {
  const ConnectivityOverlayWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityState>(
      builder: (BuildContext context, ConnectivityState state) {
        if (state == ConnectivityDisconnected()) {
          return Stack(
            children: <Widget>[child, const NoInternetPopUpWidget()],
          );
        }
        return child;
      },
    );
  }
}
