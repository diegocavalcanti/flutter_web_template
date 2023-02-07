import 'package:flutter/material.dart';

class DataTablePaginator extends StatefulWidget {
  final String labelPage;
  final String labelRecords;
  final int pageSize;
  final int totalRecords;
  final int limitPages;
  final bool generateListPages;
  final void Function(int page) onPageChanged;
  final int Function() onGetCurrentPage;

  const DataTablePaginator({
    Key? key,
    this.labelPage = 'Página',
    this.labelRecords = 'Registros',
    this.limitPages = 10,
    this.generateListPages = true,
    required this.onPageChanged,
    required this.pageSize,
    required this.totalRecords,
    required this.onGetCurrentPage,
  }) : super(key: key);

  @override
  State<DataTablePaginator> createState() => _DataTablePaginatorState();
}

int currentToFiedPage(int value) {
  return value + 1;
}

int fieldToCurrentPage(int value) {
  return value + 1;
}

class _DataTablePaginatorState extends State<DataTablePaginator> {
  int get maxPageSize => (widget.totalRecords / widget.pageSize).ceil();
  TextEditingController fieldPage = TextEditingController();

  @override
  void initState() {
    fieldPage.text = (currentToFiedPage(_getCurrentPage())).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 45,
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Wrap(
              children: [
                SizedBox(
                  width: 90,
                  child: Column(
                    children: [
                      Text(
                        "${widget.totalRecords} Registros",
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Arial",
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "$maxPageSize Páginas",
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Arial",
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                DcButton(
                  onPressed: _getCurrentPage() != 0 ? _first : null,
                  child: const Icon(Icons.first_page, color: Colors.white),
                ),
                DcButton(
                  onPressed: _getCurrentPage() > 0 ? _prev : null,
                  child: const Icon(Icons.chevron_left, color: Colors.white),
                ),
                // ..._generateButtonList(context),
                SizedBox(
                  width: 40,
                  height: 30,
                  child: TextFormField(
                    controller: fieldPage,
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        _setCurrentPageNoModify(int.parse(value)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 11,
                    ),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hoverColor: Colors.white60,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                //fim botoes
                DcButton(
                  onPressed:
                      _getCurrentPage() + 1 >= maxPageSize ? null : _next,
                  child: const Icon(Icons.chevron_right, color: Colors.white),
                ),
                DcButton(
                  onPressed:
                      (_getCurrentPage() != maxPageSize - 1) ? _last : null,
                  child: const Icon(Icons.last_page, color: Colors.white),
                ),
              ],

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //       '$labelRecords: ${totalRecords}   $labelPage: ${_getCurrentPage() + 1}/$maxPageSize',
              //       style: const TextStyle(fontWeight: FontWeight.bold)),
              // ),
            ),
          ),
        ],
      ),
    );
  }

  int _getCurrentPage() {
    return widget.onGetCurrentPage();
  }

  _setCurrentPage(int value) {
    if (value < 0) value = 0;
    if (value > maxPageSize) value = maxPageSize;
    widget.onPageChanged(value);
    fieldPage.text = (currentToFiedPage(value)).toString();
  }

  _setCurrentPageNoModify(int value) {
    fieldPage.text = (value).toString();
    value = value - 1;
    if (value < 0) value = 0;
    if (value > maxPageSize) value = maxPageSize;
    widget.onPageChanged(value);
  }

  _first() {
    _setCurrentPage(0);
  }

  _last() {
    _setCurrentPage(maxPageSize - 1);
  }

  _prev() {
    _setCurrentPage(_getCurrentPage() - 1);
  }

  _next() {
    _setCurrentPage(_getCurrentPage() + 1);
  }
}

class DcButton extends StatelessWidget {
  /// Callback for button press.
  final VoidCallback? onPressed;

  /// The child of the button.
  final Widget child;

  /// Whether the button is currently selected.

  /// Creates an instance of [DcButton].
  const DcButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
          shape: const CircleBorder(),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        child: child,
      ),
    );
  }
}
