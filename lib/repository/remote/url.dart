class Url {
  Uri getCustomer(int pk) => Uri.parse("http://127.0.0.1:8000/companies/$pk/");
  Uri getCustomers() => Uri.parse('http://127.0.0.1:8000/companies/1/');
  getInvoice(int pk) => Uri.parse('http://127.0.0.1:8000/invoices/$pk/');
  getInvoices() => Uri.parse('http://127.0.0.1:8000/invoices/');
}
