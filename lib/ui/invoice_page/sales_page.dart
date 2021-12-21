import 'package:authentication_repository/authentication_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/repository/remote/firestore.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/ui/invoice_page/subpages/invoice_detail_page/invoice_detail_page.dart';

import 'invoice_bloc/drive_bloc.dart';
import 'subpages/new_invoice_page/new_invoice_page.dart';
import 'subpages/view_pdf_page/view_pdf_page.dart';

class InvoiceBody extends StatelessWidget {
  const InvoiceBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<InvoiceBloc>()..add(FilesFetched());
    return SafeArea(
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
    );
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
        context.goNamed("create_invoice_page");
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
  late InvoiceBloc driveBloc;
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    driveBloc = context.read<InvoiceBloc>();
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
  late InvoiceBloc listData;
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    listData = context.watch<InvoiceBloc>();
    return ListView.builder(
      itemBuilder: (context, index) {
        return index >= listData.state.listdata.length
            ? BottomLoader()
            : InvoiceListItem(invoice: listData.state.listdata[index]);
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
  final Invoice invoice;

  const InvoiceListItem({Key? key, required this.invoice}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Color color;
    switch (invoice.paymentStatus) {
      case PaymentStatus.open:
        color = Colors.red[700] as Color;
        break;
      case PaymentStatus.partial:
        color = Colors.orange[400] as Color;
        break;
      case PaymentStatus.closed:
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
        title: Text("${invoice.invoiceNo}"),
        subtitle: Text("${invoice.company.name}"),
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Amt :${invoice.totalPrice}"),
                  Text("Invoice Date:${invoice.date}"),
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  context.goNamed("invoice_detail_page",
                      params: {"invoice_no": invoice.invoiceNo.toString()},
                      extra: invoice);
                },
                child: Text('VIEW PDF'))
          ])
        ],
      ),
    );
  }
}
