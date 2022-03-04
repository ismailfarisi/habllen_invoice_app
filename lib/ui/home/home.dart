import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/ui/customer_page/customer_page.dart';
import 'package:habllen/ui/home/bloc/hometab_bloc.dart';
import 'package:habllen/ui/home/subpages/screen_selector_dialog.dart';
import 'package:habllen/ui/invoice_page/invoice_page.dart';
import 'package:habllen/ui/products_page/products_page.dart';
import 'package:habllen/ui/settings_page/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final String screenName = context
        .watch<HometabBloc>()
        .state
        .currentTab
        .toString()
        .split(".")
        .last;
    final bloc = context.watch<HometabBloc>();
    return Scaffold(
      appBar: SharedAppBar(screenName: screenName),
      body: SwitchBody(bloc.state.currentTab),
    );
  }
}

class SharedAppBar extends StatefulWidget with PreferredSizeWidget {
  const SharedAppBar({
    Key? key,
    required this.screenName,
  }) : super(key: key);

  final String screenName;

  @override
  State<SharedAppBar> createState() => _SharedAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _SharedAppBarState extends State<SharedAppBar> {
  bool _searchFocused = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SharedAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      AppBar(
        leadingWidth: 150,
        leading: TextButton(
            onPressed: () {
              context.pushNamed(ScreenSelectorDialog.routeName);
            },
            child: Row(children: [
              Text(widget.screenName),
              Icon(Icons.arrow_drop_down),
            ])),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _searchFocused = true;
                });
              },
              icon: Icon(Icons.search)),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              context.pushNamed(SettingsPage.routeName);
            },
          ),
        ],
      ),
      if (_searchFocused)
        AnimatedSearchBar(
          onBackPressed: () {
            setState(() {
              _searchFocused = false;
            });
          },
        )
    ]);
  }
}

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({Key? key, this.onBackPressed}) : super(key: key);

  final Function()? onBackPressed;

  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar>
    with TickerProviderStateMixin {
  late final AnimationController _searchAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 3000));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(begin: Offset(0, 0), end: Offset(0, 1))
        .animate(_searchAnimationController);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SlideTransition(
          position: animation,
          child: child,
        );
      },
      child: Container(
          color: Theme.of(context).colorScheme.background,
          height: kToolbarHeight,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: widget.onBackPressed,
                ),
                hintText: "Search",
                border: InputBorder.none,
              ),
            ),
          )),
    );
  }
}

class SwitchBody extends StatelessWidget {
  const SwitchBody(this.selectedIndex, {Key? key}) : super(key: key);
  final HomeTab selectedIndex;
  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case HomeTab.Invoice:
        return const InvoicePage();

      case HomeTab.Customer:
        return CustomerPage();
      case HomeTab.Product:
        return const ProductsPage();
      default:
        return InvoicePage();
    }
  }
}
