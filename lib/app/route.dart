import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/payment.dart';
import 'package:habllen/model/statement.dart';
import 'package:habllen/repository/auth_repository.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/shared/constants/constants.dart';
import 'package:habllen/shared/widgets/transitions.dart';
import 'package:habllen/ui/customer_page/bloc/customer_bloc.dart';
import 'package:habllen/ui/customer_page/subpages/add_customer_dialog/add_customer_form.dart';
import 'package:habllen/ui/customer_page/subpages/add_customer_dialog/bloc/customer_form_bloc.dart';
import 'package:habllen/ui/customer_page/subpages/customer_detail_page/bloc/customerdetail_bloc.dart';
import 'package:habllen/ui/customer_page/subpages/customer_detail_page/customer_detail_page.dart';
import 'package:habllen/ui/customer_page/subpages/customer_detail_page/subpage/bloc/registerpayment_bloc.dart';
import 'package:habllen/ui/customer_page/subpages/customer_detail_page/subpage/register_payment_full_dialog.dart';
import 'package:habllen/ui/customer_page/subpages/view_statement_page/cubit/view_statement_page_cubit.dart';
import 'package:habllen/ui/customer_page/subpages/view_statement_page/view_statement_page.dart';
import 'package:habllen/ui/home/home.dart';
import 'package:habllen/ui/home/subpages/screen_selector_dialog.dart';
import 'package:habllen/ui/invoice_page/invoice_detail_bloc/invoice_detail_bloc.dart';
import 'package:habllen/ui/invoice_page/subpages/add_basic_info/add_basic_info.dart';
import 'package:habllen/ui/invoice_page/subpages/add_basic_info/bloc/basic_info_bloc.dart';

import 'package:habllen/ui/invoice_page/subpages/add_invoice_customer_page/add_invoice_customer_page.dart';
import 'package:habllen/ui/invoice_page/subpages/add_invoice_customer_page/cubit/add_invoice_customer_page_cubit.dart';
import 'package:habllen/ui/invoice_page/subpages/add_invoice_product_dialog/add_invoice_product_dialog.dart';
import 'package:habllen/ui/invoice_page/subpages/add_invoice_product_dialog/bloc/addinvoiceproductform_bloc.dart';
import 'package:habllen/ui/invoice_page/subpages/add_invoiceproduct_details_page/add_invoice_product_details_page.dart';
import 'package:habllen/ui/invoice_page/subpages/invoice_detail_page/bloc/invoicedetailpage_bloc.dart';
import 'package:habllen/ui/invoice_page/subpages/invoice_detail_page/invoice_detail_page.dart';
import 'package:habllen/ui/invoice_page/subpages/new_invoice_page/bloc/new_invoice_Bloc.dart';
import 'package:habllen/ui/invoice_page/subpages/new_invoice_page/new_invoice_page.dart';
import 'package:habllen/ui/invoice_page/subpages/view_pdf_page/view_pdf_page.dart';
import 'package:habllen/ui/login_page/login_page.dart';
import 'package:habllen/ui/login_page/subpage/register_page/register_page.dart';
import 'package:habllen/ui/products_page/bloc/productspage_bloc.dart';
import 'package:habllen/ui/products_page/products_page.dart';
import 'package:habllen/ui/products_page/sub_pages/add_product_dialog/bloc/addproductform_bloc.dart';
import 'package:habllen/ui/settings_page/settings_page.dart';
import 'package:habllen/ui/settings_page/subpages/change_password_page/bloc/change_password_bloc.dart';
import 'package:habllen/ui/settings_page/subpages/change_password_page/change_password_page.dart';
import 'package:habllen/ui/settings_page/subpages/company_profile_page/bloc/company_profile_bloc.dart';
import 'package:habllen/ui/settings_page/subpages/company_profile_page/company_profile_page.dart';
import 'package:habllen/ui/settings_page/subpages/manage_subuser_page/bloc/manage_subuser_bloc.dart';
import 'package:habllen/ui/settings_page/subpages/manage_subuser_page/manage_subuser_page.dart';
import 'package:habllen/ui/splash_page/splash_page.dart';
import 'package:habllen/ui/products_page/sub_pages/add_product_dialog/add_product_dialog.dart';
import "package:flutter_bloc/flutter_bloc.dart";

import 'bloc/auth/authentication_bloc.dart';

class Routes {
  Routes(this.bloc, Repository repository)
      : newInvoiceBloc = NewInvoiceBloc(repository);
  final AuthenticationBloc bloc;
  NewInvoiceBloc newInvoiceBloc;

  final RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();
  GoRouter mainRoutes() {
    final Stream stream = bloc.stream;
    return GoRouter(
        observers: [routeObserver],
        routes: [home, login, splashPage],
        redirect: (state) {
          final logInStatusUnkonown =
              bloc.state.status == AuthenticationStatus.unknown;
          final isInSplashPage = state.location == '/splash_page';
          if (logInStatusUnkonown && !isInSplashPage) return "/splash_page";
          final isLoggedIn =
              bloc.state.status == AuthenticationStatus.authenticated;
          final isNotLoggedIn =
              bloc.state.status == AuthenticationStatus.unauthenticated;
          final isLoggingIn = state.location == '/login';
          final isGoingToRegister = state.location == '/login/register_page';

          if (isNotLoggedIn && !isLoggingIn && !isGoingToRegister)
            return '/login';
          if (isLoggedIn &&
              (isLoggingIn || isGoingToRegister || isInSplashPage)) return '/';

          return null;
        },
        refreshListenable: GoRouterRefreshStream(stream),
        debugLogDiagnostics: true);
  }

  final splashPage = GoRoute(
      path: "/splash_page",
      name: "splash_page",
      builder: (context, state) => const SplashPage());

  late final home = GoRoute(
      path: '/',
      name: '/home',
      builder: (context, state) => HomePage(),
      routes: homeRoutes);
  static final login = GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
      routes: [
        GoRoute(
            path: "register_page",
            name: "register_page",
            pageBuilder: (context, state) => CustomTransitionPage(
                opaque: false,
                pageBuilder: (context, anim1, anim2) => const RegisterPage(),
                barrierDismissible: true,
                transitionsBuilder: (context, Animation<double> animation,
                    secondaryAnimation, child) {
                  final offsetAnimation = Tween(
                    begin: Offset(0.0, 1.0),
                    end: Offset(0.0, 0.2),
                  ).chain(CurveTween(curve: Curves.easeIn)).animate(animation);
                  return SlideTransition(
                      position: offsetAnimation, child: child);
                }))
      ]);

  late final homeRoutes = [
    routeToScreenSelectorDialog,
    routeToAddProductDialog,
    routeToCreateNewInvoicePage,
    routeToCustomerDetailPage,
    routeToSettingsPage,
    routeToInvoiceDetailPage,
    routeToProductListPage,
    routeToRegisterPaymentDialog,
    routeToAddCustomerPage
  ];

  static final routeToRegisterPaymentDialog = GoRoute(
      path: 'reister_payment_full_dialog',
      name: RegisterPaymentFullDialog.routeName,
      pageBuilder: (context, state) {
        final companyId = state.queryParams['companyId'] as String;
        return BottomToTopSlideTransition(
            child: BlocProvider(
              create: (context) => RegisterpaymentBloc(
                  companyId: companyId, repository: context.read<Repository>()),
              child: RegisterPaymentFullDialog(),
            ),
            fullscreenDialog: true);
      });
  static final routeToScreenSelectorDialog = GoRoute(
      path: "screen_Selector_dialog",
      name: ScreenSelectorDialog.routeName,
      pageBuilder: (context, state) => CustomTransitionPage(
          pageBuilder: (context, anim1, anim2) => const ScreenSelectorDialog(),
          opaque: false,
          barrierDismissible: true,
          barrierLabel: "screen_Selector_dialog",
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final offsetAnimation = Tween(
              begin: Offset(0.0, -1.0),
              end: Offset(0.0, 0.0),
            ).chain(CurveTween(curve: Curves.bounceInOut)).animate(animation);

            return SlideTransition(position: offsetAnimation, child: child);
          }));
  final routeToInvoiceDetailPage = GoRoute(
      name: "invoice_detail_page",
      path: 'invoice_detail_page',
      builder: (context, state) {
        final invoice = state.extra as Invoice;
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  InvoicedetailpageBloc(repository: context.read<Repository>()),
            ),
            BlocProvider(
              create: (context) => InvoiceDetailBloc(invoice: invoice),
            )
          ],
          child: InvoiceDetailPage(),
        );
      },
      routes: [
        GoRoute(
            path: "pdf_view_page",
            name: ViewPdfPage.routeName,
            builder: (context, state) {
              final Invoice invoice = state.extra as Invoice;
              return ViewPdfPage(invoice);
            })
      ]);
  late final routeToCreateNewInvoicePage = GoRoute(
      path: "create_new_invoice_page",
      name: NewInvoicePage.routeName,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => InvoiceDetailBloc(),
            ),
            BlocProvider(
              create: (context) => NewInvoiceBloc(context.read<Repository>()),
            ),
          ],
          child: NewInvoicePage(),
        );
      },
      routes: [
        GoRoute(
            path: "add_invoice_basic_info_page",
            name: AddBasicInfoPage.routeName,
            pageBuilder: (context, state) {
              final bloc = state.extra as InvoiceDetailBloc;
              return BottomToTopSlideTransition(
                fullscreenDialog: true,
                child: BlocProvider(
                  create: (context) => BasicInfoBloc(bloc),
                  child: AddBasicInfoPage(),
                ),
              );
            }),
        GoRoute(
            path: "add_invoice_customer_dialog",
            name: AddInvoiceCustomerPage.routeName,
            pageBuilder: (context, state) {
              final bloc = state.extra as InvoiceDetailBloc;
              return BottomToTopSlideTransition(
                  child: BlocProvider(
                create: (context) => AddInvoiceCustomerPageCubit(
                    invoiceDetailBloc: bloc,
                    repository: context.read<Repository>()),
                child: AddInvoiceCustomerPage(),
              ));
            }),
        GoRoute(
            path: "add_invoice_product_full_dialog",
            name: AddInvoiceProductPage.routeName,
            routes: [routeToAddInvoiceProductDetailsPage],
            pageBuilder: (context, state) {
              final _bloc = state.extra as InvoiceDetailBloc;
              return BottomToTopSlideTransition(
                  fullscreenDialog: true,
                  child: BlocProvider(
                      create: (context) => AddinvoiceproductformBloc(
                          repository: context.read(), bloc: _bloc),
                      child: AddInvoiceProductPage()));
            }),
      ]);
  static final routeToProductListPage = GoRoute(
      path: "product_list_page",
      name: "product_list_page",
      builder: (context, state) => ProductsPage());
  static final routeToAddProductDialog = GoRoute(
      path: "add_product_full_dialog",
      name: AddProductPage.routeName,
      pageBuilder: (context, state) {
        late final AddProductPageArguments arguments;
        if (state.extra != null) {
          arguments = state.extra as AddProductPageArguments;
        }
        return BottomToTopSlideTransition(
            key: state.pageKey,
            fullscreenDialog: true,
            child: BlocProvider(
                create: (context) => AddProductFormBloc(
                    repository: context.read<Repository>(),
                    productspageBloc: arguments.productspageBloc,
                    product: arguments.product),
                child: AddProductPage()));
      });
  static final routeToAddCustomerPage = GoRoute(
    path: "add_customer_page",
    name: AddCustomerPage.routeName,
    pageBuilder: (context, state) {
      late final AddCustomerPageArguments arguments;
      if (state.extra != null) {
        arguments = state.extra as AddCustomerPageArguments;
      }

      return BottomToTopSlideTransition(
          key: state.pageKey,
          fullscreenDialog: true,
          child: BlocProvider(
              create: (context) => CustomerFormBloc(
                  customerBloc: arguments.customerBloc,
                  repository: context.read(),
                  customer: arguments.customer),
              child: AddCustomerPage()));
    },
  );
  static final routeToCustomerDetailPage = GoRoute(
      path: "customer_detail_page",
      name: "customer_detail_page",
      builder: (context, state) {
        final Customer company = state.extra as Customer;
        return BlocProvider(
          create: (context) => CustomerDetailBloc(
              repository: context.read<Repository>(), company: company),
          child: CustomerDetailPage(
            company: company,
          ),
        );
      },
      routes: [
        GoRoute(
            path: ViewStatementPage.routeName,
            name: ViewStatementPage.routeName,
            builder: (context, state) {
              final arguments = state.extra as ViewStatementPageArguments;
              print(arguments);
              final List<Payment> paymentList = arguments.paymentList;
              final List<Invoice> invoiceList = arguments.invoiceList;
              final Customer customer = arguments.customer;
              print(customer);
              return BlocProvider(
                create: (context) => ViewStatementPageCubit(
                  customer: customer,
                  paymentList: paymentList,
                  invoiceList: invoiceList,
                ),
                child: ViewStatementPage(),
              );
            })
      ]);

  static final routeToSettingsPage = GoRoute(
      path: "settings_page",
      name: SettingsPage.routeName,
      builder: (context, state) => const SettingsPage(),
      routes: [
        GoRoute(
            path: ChangePasswordPage.routeName,
            name: ChangePasswordPage.routeName,
            builder: (context, state) {
              return BlocProvider(
                create: (context) => ChangePasswordBloc(
                    repository: context.read<AuthenticationRepository>()),
                child: ChangePasswordPage(),
              );
            }),
        GoRoute(
            path: CompanyProfilePage.routeName,
            name: CompanyProfilePage.routeName,
            builder: (context, state) {
              return BlocProvider(
                create: (context) =>
                    CompanyProfileBloc(repository: context.read<Repository>()),
                child: CompanyProfilePage(),
              );
            }),
        GoRoute(
            path: ManageSubuserPage.routeName,
            name: ManageSubuserPage.routeName,
            builder: (context, state) {
              return BlocProvider(
                create: (context) =>
                    ManageSubusersBloc(repository: context.read<Repository>()),
                child: ManageSubuserPage(),
              );
            }),
      ]);
  static final routeToAddInvoiceProductDetailsPage = GoRoute(
      path: "add_invoiceproduct_details_page",
      name: AddInvoiceProductDetailsPage.routeName,
      pageBuilder: (context, state) {
        final bloc = state.extra as AddinvoiceproductformBloc;
        return BottomToTopSlideTransition(
            fullscreenDialog: true,
            child: BlocProvider.value(
                value: bloc, child: AddInvoiceProductDetailsPage()));
      });
}

extension ReadOrNull on BuildContext {
  T? readOrNull<T>() {
    try {
      return read<T>();
    } on ProviderNotFoundException catch (_) {
      return null;
    }
  }
}
