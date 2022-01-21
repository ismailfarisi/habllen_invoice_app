import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/model/invoice.dart';

import 'invoice_bloc/invoicepage_bloc.dart';

class InvoiceBody extends StatelessWidget {
  const InvoiceBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<InvoiceBloc>().add(FilesFetched());
    return SafeArea(
      child: Scaffold(
        appBar: TopActionBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pushNamed("create_invoice_page"),
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListDetails(),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class TopActionBar extends StatelessWidget implements PreferredSizeWidget {
  const TopActionBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        shape: BoxShape.rectangle,
      ),
      height: 60,
      child: Row(
        children: [
          SearchTextField(),
        ],
      ),
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
  late InvoiceBloc invoiceBloc;
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    invoiceBloc = context.read<InvoiceBloc>();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
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
              invoiceBloc.add(KeywordChanged(string));
            },
            controller: _controller,
            decoration:
                InputDecoration(hintText: "Search", border: InputBorder.none),
            keyboardType: TextInputType.text,
          ),
        ),
        if (_focusNode.hasFocus || _controller.text != "")
          IconButton(
              onPressed: () {
                _controller.clear();
                _focusNode.unfocus();
                invoiceBloc.add(KeywordChanged(_controller.text));
              },
              icon: Icon(Icons.cancel)),
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
  late InvoiceBloc invoiceBloc;
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    invoiceBloc = context.watch<InvoiceBloc>();
    return RefreshIndicator(
      onRefresh: () async {
        context.read<InvoiceBloc>().add(FilesFetched());
      },
      child: ListView.builder(
        itemBuilder: (context, index) {
          return index >= invoiceBloc.state.listdata.length
              ? BottomLoader()
              : InvoiceListItem(invoice: invoiceBloc.state.listdata[index]);
        },
        itemCount: invoiceBloc.state.hasReachedMax
            ? invoiceBloc.state.listdata.length
            : invoiceBloc.state.listdata.length + 1,
        controller: _scrollController,
      ),
    );
  }

  void _onScroll() {
    print("is bottom : $_isBottom");
    if (_isBottom) {
      invoiceBloc.add(FilesFetched());
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
                child: Text('View Details'))
          ])
        ],
      ),
    );
  }
}
