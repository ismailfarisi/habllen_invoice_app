import 'package:authentication_repository/authentication_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/bloc/drive/drive_bloc.dart';
import 'package:sales_api/sales_api.dart';

class CreateInvoicePage extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: CreateInvoicePage());

  @override
  Widget build(BuildContext pageContext) {
    final AuthenticationRepository authenticationRepository =
        pageContext.read<AuthenticationRepository>();

    return Scaffold(
      body: SafeArea(
          child: BlocProvider<DriveBloc>(
              create: (blocContext) =>
                  DriveBloc(authenticationRepository)..add(FilesFetched()),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle, color: Colors.white),
                    height: 60,
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.of(pageContext).pop();
                            }),
                        SearchTextField(),
                      ],
                    ),
                  ),
                  Expanded(child: ListDetails()),
                ],
              ))),
    );
  }
}

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late TextEditingController _controller;
  late DriveBloc driveBloc;
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    driveBloc = context.read<DriveBloc>();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(children: [
        Expanded(
          child: TextField(
            focusNode: _focusNode,
            onChanged: (string) {
              driveBloc.add(KeywordChanged(string));
            },
            controller: _controller,
            decoration:
                InputDecoration(hintText: "Search", border: InputBorder.none),
            keyboardType: TextInputType.text,
          ),
        ),
        IconButton(
            onPressed: () {
              _controller.clear();
              _focusNode.unfocus();
            },
            icon: Icon(Icons.cancel))
      ]),
    );
  }
}

class ListDetails extends StatefulWidget {
  @override
  _ListDetailsState createState() => _ListDetailsState();
}

class _ListDetailsState extends State<ListDetails> {
  late DriveBloc listData;
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    listData = context.watch<DriveBloc>();
    return ListView.builder(
      itemBuilder: (context, index) {
        return index >= listData.state.listdata.length
            ? BottomLoader()
            : PostListItem(driveFile: listData.state.listdata[index]);
      },
      itemCount: listData.state.hasReachedMax
          ? listData.state.listdata.length
          : listData.state.listdata.length + 1,
      controller: _scrollController,
    );
  }

  void _onScroll() {
    if (_isBottom) listData.add(FilesFetched());
  }

  bool get _isBottom {
    print(_scrollController.hasClients);
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}

class PostListItem extends StatelessWidget {
  final DriveFileList driveFile;

  const PostListItem({Key? key, required this.driveFile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      elevation: 2,
      child: ListTile(
        title: Text("${driveFile.folderName}"),
        subtitle: Text("${driveFile.folderId}"),
      ),
    );
  }
}
