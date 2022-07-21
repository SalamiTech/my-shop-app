import 'package:flutter/material.dart';

import 'refresh_wrapper.dart';

class EmptyStateScreen extends StatelessWidget {
  final Function onRefresh;
  final String message;
  final IconData? icon;
  final Widget? iconWidget;

  final Widget Function(BuildContext context)? builder;
  final Widget? bottom;

  const EmptyStateScreen({
    Key? key,
    required this.onRefresh,
    required this.message,
    this.iconWidget,
    this.icon = Icons.data_usage,
    this.builder,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Scaffold(
      body: RefreshWrapper(
        onRefresh: () => onRefresh.call(),
        body: Builder(
          builder: (_) {
            if (builder != null) return builder!.call(context);

            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    constraints: const BoxConstraints(minHeight: 200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: double.maxFinite),
                        SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              if (icon != null) ...[
                                Icon(
                                  icon,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                                const SizedBox(height: 24),
                              ] else if (iconWidget != null) ...[
                                iconWidget!,
                                const SizedBox(height: 24),
                              ],
                              Text(
                                message,
                                textAlign: TextAlign.center,
                                style: _themeData.textTheme.headline4!.copyWith(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(height: 16),
                              if (bottom != null) ...[
                                const SizedBox(height: 30),
                                bottom!,
                              ]
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
