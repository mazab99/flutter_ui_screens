import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_table.dart';

class TableExapmle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomTable(children: [
            CustomTableRow.fromTexts(
              texts: const [
                'Buster',
                'Arts',
                'Quick',
                'Extra',
                'NP',
                'Def',
              ],
              defaults: TableCellData(isHeader: true, maxLines: 1),
            ),
            CustomTableRow.fromTexts(
              texts: [
                [
                  1,
                  2,
                  3,
                  4,
                ],
                [
                  1,
                  2,
                  3,
                  4,
                ],
                [
                  1,
                  2,
                  3,
                  4,
                ],
                [
                  1,
                  2,
                  3,
                  4,
                ],
                [
                  1,
                  2,
                  3,
                  4,
                ],
              ].map((e) => '${e.first / 100}%').toList(),
            ),
            CustomTableRow(children: [
              TableCellData(
                child: const Text.rich(
                  TextSpan(
                    text: 'Hits',
                    children: [
                      TextSpan(
                        text: 'xvcxz',
                      ),
                    ],
                  ),
                ),
                isHeader: true,
              ),
              TableCellData(
                text: 'Hits',
                flex: 5,
                alignment: Alignment.centerLeft,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.lineThrough,
                ),
              )
            ]),
          ]),
        ],
      ),
    );
  }
}
