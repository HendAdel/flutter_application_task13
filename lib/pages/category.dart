import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: DataTable(
            // headingRowColor: Colors.blue,
            showCheckboxColumn: true,

            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Description')),
            ],
            rows: [],
            // rows: data
            // .map((e) =>
            // DataRow(cells: [DataCell(Text( e['id'].toString())),
            // DataCell(Text( e['name'].toString())),
            // DataCell(Text( e['description'].toString())),
            // ])
            //  ),
          ),
        ));
  }
}
