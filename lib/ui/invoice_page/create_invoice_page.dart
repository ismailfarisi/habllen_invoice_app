import 'package:authentication_repository/authentication_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/bloc/drive/drive_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sales_api/model/invoice_details.dart';
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          shape: BoxShape.rectangle,
                          color: Colors.white),
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
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ListDetails(),
                    )),
                    Positioned(
                        bottom: 10,
                        height: 20,
                        child: ElevatedButton(
                          child: Text("create new invoice"),
                          onPressed: () {},
                        ))
                  ],
                ),
              ))),
    );
  }
}

// search box widget to search invoices
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
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus;
      });
    });
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
        if (_focusNode.hasFocus)
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

// invoice listview widget
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

// loading animation at the bottom of invoice listview
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

// card item decoration for the invoice details
class PostListItem extends StatelessWidget {
  final InvoiceDetails driveFile;

  const PostListItem({Key? key, required this.driveFile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Color color;
    switch (driveFile.paymentStatus) {
      case "open":
        color = Colors.red[700] as Color;
        break;
      case "partial":
        color = Colors.orange[400] as Color;
        break;
      case "closed":
        color = Colors.green;
        break;
      default:
        color = Colors.red;
    }
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: color.withOpacity(.6), width: 2)),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.all(15),
        expandedAlignment: Alignment.topLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        title: Text("${driveFile.invoiceNo}"),
        subtitle: Text("${driveFile.company!.companyName}"),
        children: [
          Text("Amt :${driveFile.amount}"),
          Text("Invoice Date:${driveFile.date}"),
        ],
      ),
    );
  }
}
