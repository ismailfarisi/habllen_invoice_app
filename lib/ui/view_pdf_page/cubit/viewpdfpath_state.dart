part of 'viewpdfpath_cubit.dart';

class ViewpdfpathState extends Equatable {
  const ViewpdfpathState({
    this.loading = true,
    this.pdfData,
    this.path = '',
  });

  @override
  List<Object?> get props => [loading, pdfData, path];

  final String? path;
  final Uint8List? pdfData;
  final bool loading;
  ViewpdfpathState copywith(
      {bool loading = true, String? path, Uint8List? pdfData}) {
    return ViewpdfpathState(loading: loading, path: path, pdfData: pdfData);
  }
}
