import 'package:authentication_repository/authentication_repository.dart';
import 'package:drive_api/drive_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/bloc/drive/drive_bloc.dart';

class CreateInvoicePage extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: CreateInvoicePage());

  @override
  Widget build(BuildContext context) {
    final AuthenticationRepository authenticationRepository =
        context.read<AuthenticationRepository>();

    return Scaffold(
      body: SafeArea(
        child: Container(
            child: BlocProvider<DriveBloc>(
                create: (context) =>
                    DriveBloc(authenticationRepository)..add(FilesFetched()),
                child: ListDetails())),
      ),
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
    listData = context.read<DriveBloc>();
    listData.getFiles();
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
    if (_isBottom) listData.getFiles();
  }

  bool get _isBottom {
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
