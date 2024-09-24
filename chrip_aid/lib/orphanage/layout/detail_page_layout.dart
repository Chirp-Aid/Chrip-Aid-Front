import 'package:chrip_aid/common/styles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailPageLayout extends StatelessWidget {
  final String? title;
  final Color? appBarBackgroundColor;
  final Color backgroundColor;
  final Color? leadingColor;
  final Color? titleColor;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? bottom;
  final Widget child;
  final List<Widget>? actions;
  final bool extendBodyBehindAppBar;

  const DetailPageLayout({
    Key? key,
    this.title,
    this.backgroundColor = Colors.white,
    this.bottomNavigationBar,
    this.titleColor = Colors.black,
    this.floatingActionButton,
    this.extendBodyBehindAppBar = true,
    required this.child,
    this.leadingColor,
    this.bottom,
    this.appBarBackgroundColor = Colors.transparent,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: child,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }

  AppBar? _appBar(BuildContext context) => AppBar(
        centerTitle: true,
        backgroundColor: appBarBackgroundColor,
        elevation: 0,
        title: title == null
            ? null
            : Text(
                title!,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: leadingColor,
            size: kIconSmallSize,
          ),
          onPressed: context.pop,
          splashRadius: kIconSmallSize,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        actions: actions,
        foregroundColor: Colors.black,
        bottom: bottom,
      );
}
