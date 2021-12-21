import 'package:go_router/go_router.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/ui/home/home.dart';
import 'package:habllen/ui/invoice_page/subpages/draft_invoice_page/draft_invoice_page.dart';
import 'package:habllen/ui/invoice_page/subpages/invoice_detail_page/invoice_detail_page.dart';
import 'package:habllen/ui/invoice_page/subpages/new_invoice_page/new_invoice_page.dart';
import 'package:habllen/ui/invoice_page/subpages/view_pdf_page/view_pdf_page.dart';
import 'package:habllen/ui/login_page/login_page.dart';

import 'bloc/auth/authentication_bloc.dart';

GoRouter routes(AuthenticationBloc bloc) {
  final Stream stream = bloc.stream;
  return GoRouter(
      routes: [Routes.home, Routes.login],
      redirect: (state) {
        final isLoggedIn =
            bloc.state.status == AuthenticationStatus.authenticated;
        final isLoggingIn = state.location == '/login';
        print(isLoggedIn);

        if (!isLoggedIn && !isLoggingIn) return '/login';
        if (isLoggedIn && isLoggingIn) return '/';

        return null;
      },
      refreshListenable: GoRouterRefreshStream(stream));
}

class Routes {
  static final home = GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
      routes: homeRoutes);
  static final login = GoRoute(
    path: '/login',
    name: 'login',
    builder: (context, state) => const LoginPage(),
  );

  static final homeRoutes = [
    GoRoute(
        name: "invoice_detail_page",
        path: 'invoice_detail_page/:invoice_no',
        builder: (context, state) {
          final invoice = state.extra as Invoice;
          return InvoiceDetailPage(invoice: invoice);
        },
        routes: [
          GoRoute(
              path: "pdf_view_page",
              name: "pdf_page",
              builder: (context, state) {
                final Invoice invoice = state.extra as Invoice;
                return ViewPdfPage(invoice);
              })
        ]),
    GoRoute(
        path: "create_new_invoice_page",
        name: "create_invoice_page",
        builder: (context, state) {
          return NewInvoicePage();
        },
        routes: [
          GoRoute(
              path: "draft_invoice_page/:invoice_no",
              name: "draft_invoice_page",
              builder: (context, state) {
                // final invoice = context.read<NewInvoiceBloc>().state.invoice;
                final Invoice invoice = state.extra as Invoice;
                return DraftInvoicePage(invoice: invoice);
              })
        ])
  ];
}
