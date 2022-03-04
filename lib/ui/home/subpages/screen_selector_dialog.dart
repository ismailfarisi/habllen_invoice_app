import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/ui/home/bloc/hometab_bloc.dart';

class ScreenSelectorDialog extends StatelessWidget {
  const ScreenSelectorDialog({Key? key}) : super(key: key);

  static const String routeName = 'screen-selector-dialog';

  @override
  Widget build(BuildContext context) {
    return BlocListener<HometabBloc, HometabState>(
      listener: (context, state) {
        context.pop();
      },
      listenWhen: (previous, current) =>
          previous.currentTab != current.currentTab,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 500),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TopBar(
                title: "Select",
              ),
              SizedBox(
                height: 10,
              ),
              Content()
            ]),
          ),
        )),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SelectionCard(
            selectionName: "Invoice",
            onTap: () {
              context.read<HometabBloc>().add(TabChanged(HomeTab.Invoice));
            },
          ),
          SelectionCard(
            selectionName: "Customer",
            onTap: () {
              context.read<HometabBloc>().add(TabChanged(HomeTab.Customer));
            },
          ),
          SelectionCard(
            selectionName: "Product",
            onTap: () {
              context.read<HometabBloc>().add(TabChanged(HomeTab.Product));
            },
          ),
          SizedBox(
            height: 4,
          )
        ],
      ),
    );
  }
}

class SelectionCard extends StatelessWidget {
  const SelectionCard({
    Key? key,
    required this.selectionName,
    this.onTap,
  }) : super(key: key);

  final String selectionName;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
      child: Card(
        elevation: 4,
        child: ListTile(
          title: Text(selectionName),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          onTap: onTap,
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.close))),
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }
}
