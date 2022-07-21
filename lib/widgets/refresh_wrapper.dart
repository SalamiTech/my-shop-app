import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class RefreshWrapper extends StatelessWidget {
  final Widget? body;
  final Future Function() onRefresh;
  final EdgeInsets? padding;
  final bool toBox;

  final ScrollController? controller;
  final Widget Function(BuildContext ctx)? buildScrollParent;

  RefreshWrapper({
    Key? key,
    required this.onRefresh,
    this.body,
    this.padding,
    this.controller,
    this.buildScrollParent,
    this.toBox = true,
  }) : super(key: key);

  final scrollContrller = ScrollController();

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || !Platform.isIOS) {
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: Scrollbar(
          controller: controller,
          child: buildScrollParent == null
              ? SingleChildScrollView(
                  controller: controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: body,
                  padding: padding,
                )
              : buildScrollParent!.call(context),
        ),
      );
    }

    var view = buildScrollParent == null
        ? SingleChildScrollView(
            child: body,
            padding: padding,
            primary: false,
          )
        : buildScrollParent!.call(context);

    if (toBox) {
      view = SliverToBoxAdapter(child: view);
    }

    return CupertinoScrollbar(
      controller: scrollContrller,
      child: CustomScrollView(
        controller: scrollContrller,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          CupertinoSliverRefreshControl(onRefresh: onRefresh),
          view,
        ],
      ),
    );
  }
}
