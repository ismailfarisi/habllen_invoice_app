class Url {
  Uri getCustomer(int pk) => Uri.parse("http://10.0.2.2:8000/companies/$pk/");
  Uri getCustomers() => Uri.parse('http://10.0.2.2:8000/companies/');
  getInvoice(int pk) => Uri.parse('http://10.0.2.2:8000/invoices/$pk/');
  getInvoices() => Uri.parse('http://10.0.2.2:8000/invoices/');
}
