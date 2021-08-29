import 'package:authentication_repository/authentication_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/bloc/drive/drive_bloc.dart';
import 'package:habllen/ui/new_invoice_page/new_invoice_page.dart';
import 'package:habllen/ui/view_pdf_page/view_pdf_page.dart';
import 'package:sales_api/model/invoice_details.dart';

class InvoiceBody extends StatelessWidget {
  const InvoiceBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationRepository authenticationRepository =
        context.read<AuthenticationRepository>();
    return BlocProvider<DriveBloc>(
        create: (blocContext) =>
            DriveBloc(authenticationRepository)..add(FilesFetched()),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TopActionBar(),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ListDetails(),
                )),
                CreateInvoiceBtn()
              ],
            ),
          ),
        ));
  }
}

class TopActionBar extends StatelessWidget {
  const TopActionBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          shape: BoxShape.rectangle,
          color: Colors.white),
      height: 60,
      child: Row(
        children: [
          SearchTextField(),
        ],
      ),
    );
  }
}

class CreateInvoiceBtn extends StatelessWidget {
  const CreateInvoiceBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("create new invoice"),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => NewInvoicePage()));
      },
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
        SizedBox(
          width: 15,
        ),
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
            : InvoiceListItem(invoiceDetails: listData.state.listdata[index]);
      },
      itemCount: listData.state.hasReachedMax
          ? listData.state.listdata.length
          : listData.state.listdata.length + 1,
      controller: _scrollController,
    );
  }

  void _onScroll() {
    print("is bottom : $_isBottom");
    if (_isBottom) {
      listData.add(FilesFetched());
    }
  }

  bool get _isBottom {
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
class InvoiceListItem extends StatelessWidget {
  final InvoiceDetails invoiceDetails;

  const InvoiceListItem({Key? key, required this.invoiceDetails})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Color color;
    switch (invoiceDetails.paymentStatus) {
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
        title: Text("${invoiceDetails.invoiceNo}"),
        subtitle: Text("${invoiceDetails.company!.companyName}"),
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Amt :${invoiceDetails.amount}"),
                  Text("Invoice Date:${invoiceDetails.date}"),
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ViewPdfPage(invoiceDetails)));
                },
                child: Text('VIEW PDF'))
          ])
        ],
      ),
    );
  }
}
