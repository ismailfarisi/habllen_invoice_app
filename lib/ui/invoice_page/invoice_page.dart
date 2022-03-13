import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/shared/utils/date_util.dart';
import 'package:habllen/ui/invoice_page/subpages/new_invoice_page/new_invoice_page.dart';

import 'invoice_bloc/invoicepage_bloc.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvoiceBloc(repository: context.read<Repository>()),
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.pushNamed(NewInvoicePage.routeName),
            child: Icon(Icons.add),
          ),
          body: ListDetails(),
        ),
      ),
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
    context.read<InvoiceBloc>().add(FilesFetched());
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    invoiceBloc = context.watch<InvoiceBloc>();
    return RefreshIndicator(
      onRefresh: () async {
        final bloc = context.read<InvoiceBloc>();
        bloc.add(FilesFetched());
        await bloc.stream
            .firstWhere((element) => element.status != FileFetchStatus.loading);
      },
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return index >= invoiceBloc.state.listdata.length
              ? BottomLoader()
              : InvoiceListItem(invoice: invoiceBloc.state.listdata[index]);
        },
        itemCount: !_isBottom
            ? invoiceBloc.state.listdata.length
            : invoiceBloc.state.listdata.length + 1,
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
      ),
    );
  }

  void _onScroll() {
    print("is bottom : $_isBottom");
    if (_isBottom) {
      invoiceBloc.add(LoadMore());
    }
  }

  bool get _isBottom {
    if (invoiceBloc.state.hasReachedMax) return false;
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.95);
  }
}

// loading animation at the bottom of invoice listview
class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: const Center(
        child: SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
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
      ),
      child: ListTile(
        onTap: () {
          context.goNamed("invoice_detail_page", extra: invoice);
        },
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${invoice.invoiceNo}"),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${invoice.date?.toDateString() ?? "No Date"}",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${invoice.company?.name}",
                      overflow: TextOverflow.fade,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Amt :${invoice.totalPrice}",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
