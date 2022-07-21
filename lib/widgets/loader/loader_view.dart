import 'package:flutter/material.dart';

class LoaderView extends StatefulWidget {
  final AnimationController controller;
  final bool useColor;
  final String? message;

  const LoaderView({
    Key? key,
    required this.controller,
    this.message = "Please wait...",
    this.useColor = true,
  }) : super(key: key);

  @override
  State<LoaderView> createState() => _LoaderViewState();
}

class _LoaderViewState extends State<LoaderView> with SingleTickerProviderStateMixin {
  AnimationController get controller => widget.controller;

  late Animation<double> blurValue = Tween(
    begin: 1.0,
    end: 0.5,
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Curves.decelerate,
  ));

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        if (!widget.useColor) {
          return child!;
        }

        return Container(
          color: Colors.black.withOpacity(blurValue.value),
          child: child,
        );
      },
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(34),
              constraints: const BoxConstraints(minWidth: 200),
              child: Column(
                children: [
                  const _AnimatedLoader(
                    imageProvider: AssetImage('assets/img/logo.png'),
                    size: 180,
                  ),
                  if (widget.message != null) ...[
                    const SizedBox(height: 24),
                    Text(
                      widget.message!,
                      style: _themeData.textTheme.subtitle1!.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                        height: 1.3,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedLoader extends StatelessWidget {
  final double size;
  final ImageProvider? imageProvider;

  const _AnimatedLoader({
    Key? key,
    this.size = 40,
    this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: SizedBox(
                width: size * 0.7,
                height: size * 0.7,
                child: const CircularProgressIndicator(
                  strokeWidth: 3.5,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              ),
            ),
          ),
          if (imageProvider != null)
            Positioned.fill(
              child: Container(
                alignment: Alignment.center,
                child: SizedBox(
                  child: Image(image: imageProvider!),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
