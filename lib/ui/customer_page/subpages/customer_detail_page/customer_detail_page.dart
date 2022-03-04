import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/shared/constants/constants.dart';
import 'package:habllen/shared/widgets/custom_progress_indicator.dart';
import 'package:habllen/shared/widgets/invoice_list_item_card.dart';
import 'package:habllen/ui/customer_page/subpages/customer_detail_page/bloc/customerdetail_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/shared/utils/date_util.dart';
import 'package:habllen/ui/customer_page/subpages/customer_detail_page/subpage/register_payment_full_dialog.dart';
import 'package:habllen/ui/customer_page/subpages/view_statement_page/view_statement_page.dart';

class CustomerDetailPage extends StatelessWidget {
  const CustomerDetailPage({Key? key, required this.company}) : super(key: key);
  final Customer company;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ScrollBody(company: company));
  }
}

class ScrollBody extends StatefulWidget {
  const ScrollBody({
    Key? key,
    required this.company,
  }) : super(key: key);

  final Customer company;

  @override
  State<ScrollBody> createState() => _ScrollBodyState();
}

class _ScrollBodyState extends State<ScrollBody>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);
  final cardKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (_tabController.index == 0) {
      if (context.read<CustomerDetailBloc>().state.invoiceListFetchStatus ==
          Status.initial) {
        BlocProvider.of<CustomerDetailBloc>(context)
            .add(CustomerDetailEvent.fetchInvoiceList());
      }
    }
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        BlocProvider.of<CustomerDetailBloc>(context)
            .add(CustomerDetailEvent.tabChanged(_tabController.index));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final headline6 = Theme.of(context)
        .textTheme
        .headline6
        ?.copyWith(fontWeight: FontWeight.bold);
    final headline5 = Theme.of(context)
        .textTheme
        .headline5
        ?.copyWith(fontWeight: FontWeight.bold);
    final dateRange =
        context.select((CustomerDetailBloc value) => value.state.dateRange);
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          pinned: true,
          title: Text(widget.company.name),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => _showStatementPdf(context),
                icon: Icon(Icons.article_outlined)),
            IconButton(
                onPressed: () => _showRegisterPayment(context),
                icon: Icon(Icons.addchart))
          ],
          bottom: AppBarBottom(),
        ),
        SliverToBoxAdapter(
          child: Card(
            key: cardKey,
            color: Theme.of(context).colorScheme.secondaryVariant,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                      "${dateRange.start.toDateString()} - ${dateRange.end.toDateString()}"),
                  SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                        text: "Overdue ",
                        style: headline6?.copyWith(color: Colors.red),
                        children: [
                          TextSpan(
                              text:
                                  "\u{20B9} ${context.select((CustomerDetailBloc value) => value.state.totalInvoiceAmount).toStringAsFixed(2)}",
                              style: headline6)
                        ]),
                  ),
                  SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                        text: "Received ",
                        style: headline6,
                        children: [
                          TextSpan(
                              text:
                                  "\u{20B9} ${context.select((CustomerDetailBloc value) => value.state.totalPaymentReceived).toStringAsFixed(2)}",
                              style: headline5)
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPersistentHeader(
            floating: false,
            pinned: true,
            delegate: PersistentHeader(
                widget: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: "Invoices"),
                Tab(text: "Payments"),
              ],
              indicator:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
              onTap: (index) {
                print(cardKey.currentContext?.size?.height);
                context
                    .read<CustomerDetailBloc>()
                    .add(CustomerDetailEvent.tabChanged(index));
              },
            ))),
      ],
      body: TabBarView(
        controller: _tabController,
        children: [InvoiceListView(), PaymentsListView()],
      ),
    );
  }

  void _showStatementPdf(BuildContext context) {
    final bloc = context.read<CustomerDetailBloc>();
    final invoiceList = bloc.state.invoiceList;
    final paymentList = bloc.state.paymentList;
    final customer = bloc.company;
    final argument = ViewStatementPageArguments(
        paymentList: paymentList, invoiceList: invoiceList, customer: customer);
    context.pushNamed(ViewStatementPage.routeName, extra: argument);
  }

  void _showRegisterPayment(BuildContext context) {
    context.pushNamed(RegisterPaymentFullDialog.routeName, queryParams: {
      "companyId": context.read<CustomerDetailBloc>().state.companyId!
    });
  }
}

class PaymentsListView extends StatelessWidget {
  const PaymentsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paymentsList =
        context.select((CustomerDetailBloc value) => value.state.paymentList);
    final paymenyStatus = context.select(
        (CustomerDetailBloc value) => value.state.paymentListFetchStatus);
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView.builder(
          itemBuilder: (context, index) {
            if (paymenyStatus == Status.loading) {
              return CustomProgressIndicator();
            }
            final payment = paymentsList[index];

            return Card(
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(payment.date.toDateString()),
                    Text(payment.amount.toString()),
                  ],
                ),
              ),
            );
          },
          itemCount:
              (paymenyStatus == Status.loading) ? 1 : paymentsList.length),
    );
  }
}

class InvoiceListView extends StatelessWidget {
  const InvoiceListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invoiceList =
        context.select((CustomerDetailBloc value) => value.state.invoiceList);
    final invoiceStatus = context.select(
        (CustomerDetailBloc value) => value.state.invoiceListFetchStatus);
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView.builder(
          itemBuilder: (context, index) {
            if (invoiceStatus == Status.loading) {
              return CustomProgressIndicator();
            }
            final invoice = invoiceList[index];

            return InvoiceListItem(invoice: invoice);
          },
          itemCount:
              (invoiceStatus == Status.loading) ? 1 : invoiceList.length),
    );
  }
}

class AppBarBottom extends StatelessWidget with PreferredSizeWidget {
  const AppBarBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border(
              top: BorderSide(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(.4),
                  width: 1),
              bottom: BorderSide(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(.4),
                  width: 1))),
      height: 40,
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextButton.icon(
            icon: Icon(Icons.arrow_drop_down),
            label: Text(context.select((CustomerDetailBloc value) =>
                value.state.filterMode.toString().split(".")[1])),
            onPressed: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  context: context,
                  builder: (bcontext) {
                    final bloc = context.read<CustomerDetailBloc>();
                    return Container(
                        child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: OutlinedButton(
                                onPressed: () {
                                  bloc.add(
                                      CustomerDetailEvent.filterModeChanged(
                                          FilterMode.lastMonth));
                                  Navigator.of(context).pop();
                                },
                                child: Text("Last month")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: OutlinedButton(
                                onPressed: () {
                                  bloc.add(
                                      CustomerDetailEvent.filterModeChanged(
                                          FilterMode.lastThreeMonths));
                                  Navigator.of(context).pop();
                                },
                                child: Text("Last 3 months")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: OutlinedButton(
                                onPressed: () {
                                  bloc.add(
                                      CustomerDetailEvent.filterModeChanged(
                                          FilterMode.lastYear));
                                  Navigator.of(context).pop();
                                },
                                child: Text("Last year")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: OutlinedButton(
                                onPressed: () async {
                                  final dateRange = await showDateRangePicker(
                                      initialEntryMode:
                                          DatePickerEntryMode.input,
                                      context: context,
                                      lastDate: DateTime.now(),
                                      firstDate: DateTime(2018),
                                      initialDateRange: bloc.state.dateRange);
                                  bloc.add(
                                      CustomerDetailEvent.filterModeChanged(
                                          FilterMode.custom,
                                          dateRange: dateRange));
                                  Navigator.of(context).pop();
                                },
                                child: Text("custom")),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ));
                  });
            }),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40);
}

class TabSelector extends StatelessWidget {
  const TabSelector(
    this._tabController, {
    Key? key,
  }) : super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabs: [
        Tab(text: "Invoices"),
        Tab(text: "Payments"),
      ],
      indicator: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      onTap: (index) {
        context
            .read<CustomerDetailBloc>()
            .add(CustomerDetailEvent.tabChanged(index));
      },
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;

  PersistentHeader({required this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      height: 56.0,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Colors.white,
        elevation: 5.0,
        child: Center(child: widget),
      ),
    );
  }

  @override
  double get maxExtent => 56;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
