import 'package:flutter/material.dart';

class ExpensePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "sss",
        onPressed: () {
          addExpenseDialog(context);
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Current Balance",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text("Cash available")
                      ],
                    ),
                    Text(
                      "\$6576",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Expense",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Credit",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Debit",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((builder, index) {
            return Card(
              margin: EdgeInsets.all(1),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text("expensefdgfddfhhgdgdshjglkjhlkj"),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("\$89.00"),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text("\$0.0"),
                    ),
                  ],
                ),
              ),
            );
          }, childCount: 6))
        ]),
      ),
    );
  }
}

Future addExpenseDialog(BuildContext context) {
  return showGeneralDialog(
      context: context,
      transitionBuilder: (context, anim1, anim2, child) {
        print(context);
        return child;
      },
      pageBuilder: (context, anim1, anim2) {
        return Hero(
          tag: "sss",
          child: AlertDialog(
            title: Text("Add Expense"),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              ElevatedButton(
                onPressed: () {},
                child: Text("Add"),
              )
            ],
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "name",
                        constraints: BoxConstraints.tightFor(height: 40)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                        hintText: "Amount",
                        constraints: BoxConstraints.tightFor(height: 40)),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
