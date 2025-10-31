// ignore_for_file: deprecated_member_use

import 'package:anmol_marketing/features/account_statements/presentation/account_statements_controller.dart';
import 'package:flutter/material.dart';
import '../../../core/barrel.dart';

class AcStatementsScreen extends GetView<AccountStatementsController> {
  const AcStatementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "A/C Statements"),
      body: Padding(
        padding: screenPadding,
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Obx(() => controller.getAccountStatementsList.isNotEmpty
            // ? IconButton(
            //     onPressed: () => _generatePDF(context),
            //     icon: Icon(
            //       Iconsax.document_download,
            //       color: AppColors.appPrimaryColor,
            //     ),
            //     tooltip: 'Download PDF',
            //   )
            // : SizedBox.shrink()),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.dialog(_buildDateFilterPopup());
                  },
                  child: Icon(Iconsax.document_filter),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Obx(() {
                    final from = controller.formatDate(
                      controller.fromDate.value,
                    );
                    final to = controller.formatDate(controller.toDate.value);

                    return Text(
                      "Showing orders from $from to $to",
                      style: context.bodySmallStyle!.copyWith(
                        color: AppColors.blackTextColor,
                      ),
                    );
                  }),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Obx(
                () => controller.isLoading.value
                    ? Center(child: LoadingIndicator())
                    : controller.getAccountStatementsList.isEmpty
                    ? Center(
                        child: Text(
                          "No data found",
                          style: context.bodyMediumStyle,
                        ),
                      )
                    : _buildAccountStatementsView(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> _generatePDF(BuildContext context) async {
  //   try {
  //     // Show loading dialog
  //     Get.dialog(
  //       Dialog(
  //         child: Padding(
  //           padding: EdgeInsets.all(20),
  //           child: Row(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               CircularProgressIndicator(),
  //               SizedBox(width: 20),
  //               Text("Generating PDF..."),
  //             ],
  //           ),
  //         ),
  //       ),
  //       barrierDismissible: false,
  //     );

  //     final pdf = pw.Document();

  //     // Add pages to PDF
  //     await _addPDFPages(pdf);

  //     // Close loading dialog
  //     Get.back();

  //     // Save and share PDF
  //     await _savePDF(pdf, context);
  //   } catch (e) {
  //     Get.back(); // Close loading dialog
  //     Get.snackbar(
  //       "Error",
  //       "Failed to generate PDF: $e",
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  // }

  // Future<void> _addPDFPages(pw.Document pdf) async {
  //   final from = controller.formatDate(controller.fromDate.value);
  //   final to = controller.formatDate(controller.toDate.value);

  //   for (
  //     int pageIndex = 0;
  //     pageIndex < controller.getAccountStatementsList.length;
  //     pageIndex++
  //   ) {
  //     final yearData = controller.getAccountStatementsList[pageIndex];

  //     pdf.addPage(
  //       pw.MultiPage(
  //         pageFormat: PdfPageFormat.a4,
  //         margin: pw.EdgeInsets.all(20),
  //         header: (context) => _buildPDFHeader(from, to),
  //         build: (context) => [_buildPDFYearSection(yearData)],
  //       ),
  //     );
  //   }
  // }

  // pw.Widget _buildPDFHeader(String from, String to) {
  //   return pw.Container(
  //     padding: pw.EdgeInsets.only(bottom: 20),
  //     decoration: pw.BoxDecoration(
  //       border: pw.Border(bottom: pw.BorderSide(color: PdfColors.grey400)),
  //     ),
  //     child: pw.Column(
  //       crossAxisAlignment: pw.CrossAxisAlignment.start,
  //       children: [
  //         pw.Text(
  //           'Account Statements',
  //           style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
  //         ),
  //         pw.SizedBox(height: 10),
  //         pw.Text(
  //           'Period: $from to $to',
  //           style: pw.TextStyle(fontSize: 12, color: PdfColors.grey700),
  //         ),
  //         pw.Text(
  //           'Generated on: ${DateFormat('dd-MMM-yyyy HH:mm').format(DateTime.now())}',
  //           style: pw.TextStyle(fontSize: 12, color: PdfColors.grey700),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // pw.Widget _buildPDFYearSection(dynamic yearData) {
  //   return pw.Column(
  //     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //     children: [
  //       // Year Header
  //       pw.Container(
  //         width: double.infinity,
  //         padding: pw.EdgeInsets.all(12),
  //         decoration: pw.BoxDecoration(
  //           color: PdfColors.blue100,
  //           borderRadius: pw.BorderRadius.circular(8),
  //         ),
  //         child: pw.Row(
  //           mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //           children: [
  //             pw.Text(
  //               yearData.finYear?.name ?? "Unknown Year",
  //               style: pw.TextStyle(
  //                 fontSize: 16,
  //                 fontWeight: pw.FontWeight.bold,
  //               ),
  //             ),
  //             pw.Column(
  //               crossAxisAlignment: pw.CrossAxisAlignment.end,
  //               children: [
  //                 pw.Text(
  //                   "Balance: ${yearData.balance?.toStringAsFixed(2) ?? '0.00'}",
  //                   style: pw.TextStyle(fontSize: 12),
  //                 ),
  //                 pw.Text(
  //                   "Dr: ${yearData.ttlDebit?.toStringAsFixed(2) ?? '0.00'} | Cr: ${yearData.ttlCredit?.toStringAsFixed(2) ?? '0.00'}",
  //                   style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),

  //       pw.SizedBox(height: 15),

  //       // Ledger Types
  //       if (yearData.ledgerTypes != null && yearData.ledgerTypes!.isNotEmpty)
  //         ...yearData.ledgerTypes!.map<pw.Widget>(
  //           (ledgerType) => _buildPDFLedgerTypeSection(ledgerType),
  //         )
  //       else
  //         pw.Container(
  //           padding: pw.EdgeInsets.all(16),
  //           child: pw.Text("No ledger data available"),
  //         ),
  //     ],
  //   );
  // }

  // pw.Widget _buildPDFLedgerTypeSection(dynamic ledgerType) {
  //   return pw.Column(
  //     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //     children: [
  //       // Ledger Type Header
  //       if (ledgerType.type != null && ledgerType.type.isNotEmpty)
  //         pw.Container(
  //           width: double.infinity,
  //           padding: pw.EdgeInsets.symmetric(vertical: 8, horizontal: 12),
  //           decoration: pw.BoxDecoration(
  //             color: PdfColors.red100,
  //             borderRadius: pw.BorderRadius.circular(4),
  //           ),
  //           child: pw.Text(
  //             "${ledgerType.type}",
  //             style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
  //           ),
  //         ),

  //       pw.SizedBox(height: 10),

  //       // Table
  //       pw.Table(
  //         border: pw.TableBorder.all(color: PdfColors.grey400),
  //         children: [
  //           // Header Row
  //           pw.TableRow(
  //             decoration: pw.BoxDecoration(color: PdfColors.grey200),
  //             children: [
  //               _buildPDFTableCell("Inv ID", isHeader: true),
  //               _buildPDFTableCell("Date", isHeader: true),
  //               _buildPDFTableCell("Dr", isHeader: true),
  //               _buildPDFTableCell("Cr", isHeader: true),
  //               _buildPDFTableCell("Balance", isHeader: true),
  //             ],
  //           ),
  //           // Data Rows
  //           if (ledgerType.ledgers != null && ledgerType.ledgers!.isNotEmpty)
  //             ...ledgerType.ledgers!.map<pw.TableRow>(
  //               (ledger) => _buildPDFLedgerRow(ledger),
  //             )
  //           else
  //             pw.TableRow(
  //               children: [
  //                 pw.Container(
  //                   padding: pw.EdgeInsets.all(8),
  //                   child: pw.Text(
  //                     "No ledger entries",
  //                     style: pw.TextStyle(fontSize: 10),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //         ],
  //       ),

  //       pw.SizedBox(height: 20),
  //     ],
  //   );
  // }

  // pw.TableRow _buildPDFLedgerRow(dynamic ledger) {
  //   String invId = "";
  //   String date = "";

  //   // Check if it's opening balance
  //   if (ledger.isOpening == true) {
  //     invId = "Opn Bal";
  //     date = ""; // Empty for opening balance
  //   } else {
  //     invId = ledger.docNbr ?? "";
  //     if (ledger.docDate != null && ledger.docDate != "0001-01-01") {
  //       try {
  //         final parsedDate = DateTime.parse(ledger.docDate);
  //         date = DateFormat("dd-MMM-yyyy").format(parsedDate);
  //       } catch (e) {
  //         date = "";
  //       }
  //     }
  //   }

  //   return pw.TableRow(
  //     children: [
  //       _buildPDFTableCell(invId),
  //       _buildPDFTableCell(date),
  //       _buildPDFTableCell(ledger.drAmount?.toStringAsFixed(0) ?? "0"),
  //       _buildPDFTableCell(ledger.crAmount?.toStringAsFixed(0) ?? "0"),
  //       _buildPDFTableCell(ledger.balance?.toStringAsFixed(0) ?? "0"),
  //     ],
  //   );
  // }

  // pw.Widget _buildPDFTableCell(String text, {bool isHeader = false}) {
  //   return pw.Container(
  //     padding: pw.EdgeInsets.all(8),
  //     child: pw.Text(
  //       text,
  //       textAlign: pw.TextAlign.center,
  //       style: pw.TextStyle(
  //         fontSize: isHeader ? 11 : 10,
  //         fontWeight: isHeader ? pw.FontWeight.bold : pw.FontWeight.normal,
  //       ),
  //     ),
  //   );
  // }

  // Future<void> _savePDF(pw.Document pdf, BuildContext context) async {
  //   try {
  //     if (Platform.isAndroid || Platform.isIOS) {
  //       // For mobile platforms, use printing package to share
  //       await Printing.sharePdf(
  //         bytes: await pdf.save(),
  //         filename:
  //             'account_statements_${DateFormat('ddMMyyyy_HHmm').format(DateTime.now())}.pdf',
  //       );
  //     } else {
  //       // For other platforms, save to documents
  //       final output = await getApplicationDocumentsDirectory();
  //       final file = File(
  //         "${output.path}/account_statements_${DateFormat('ddMMyyyy_HHmm').format(DateTime.now())}.pdf",
  //       );
  //       await file.writeAsBytes(await pdf.save());

  //       Get.snackbar(
  //         "Success",
  //         "PDF saved to: ${file.path}",
  //         backgroundColor: Colors.green,
  //         colorText: Colors.white,
  //         duration: Duration(seconds: 3),
  //       );
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //       "Error",
  //       "Failed to save PDF: $e",
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  // }

  Widget _buildAccountStatementsView() {
    return ListView.builder(
      itemCount: controller.getAccountStatementsList.length,
      itemBuilder: (context, index) {
        final yearData = controller.getAccountStatementsList[index];
        return _buildYearCard(yearData, context);
      },
    );
  }

  Widget _buildYearCard(dynamic yearData, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Obx(() {
        final isExpanded =
            controller.expandedYears[yearData.finYear?.name] ?? false;

        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: ExpansionTile(
            collapsedBackgroundColor: AppColors.darkGreyColor.withOpacity(0.3),
            backgroundColor: AppColors.appPrimaryColor.withOpacity(0.15),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  yearData.finYear?.name ?? "Unknown Year",
                  style: context.bodyMediumStyle,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Balance: ${yearData.balance?.toStringAsFixed(2) ?? '0.00'}",
                      style: context.bodySmallStyle,
                    ),
                    Text(
                      "Dr: ${yearData.ttlDebit?.toStringAsFixed(2) ?? '0.00'} | Cr: ${yearData.ttlCredit?.toStringAsFixed(2) ?? '0.00'}",
                      style: context.displayLargeStyle!.copyWith(
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
              color: AppColors.appPrimaryColor,
            ),
            onExpansionChanged: (expanded) {
              controller.toggleYearExpansion(
                yearData.finYear?.name ?? "",
                expanded,
              );
            },
            children: [
              if (yearData.ledgerTypes != null &&
                  yearData.ledgerTypes!.isNotEmpty)
                ...yearData.ledgerTypes!.map(
                  (ledgerType) => _buildLedgerTypeSection(ledgerType, context),
                )
              else
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("No ledger data available"),
                ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildLedgerTypeSection(dynamic ledgerType, BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          if (ledgerType.type != null && ledgerType.type.isNotEmpty)
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              decoration: BoxDecoration(color: Colors.red.withOpacity(0.1)),
              child: Text(
                "${ledgerType.type}",
                style: context.displayLargeStyle!.copyWith(
                  color: AppColors.blackTextColor,
                ),
              ),
            ),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white, // Ensure white background
            ),
            child: Column(
              children: [
                // Table Header
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: _buildTableRow(
                    ["Inv ID", "Date", "Dr", "Cr", "Balance"],
                    isHeader: true,
                    context,
                  ),
                ),

                // Table Data
                if (ledgerType.ledgers != null &&
                    ledgerType.ledgers!.isNotEmpty)
                  ...ledgerType.ledgers!.map(
                    (ledger) => _buildLedgerRow(ledger, context),
                  )
                else
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(16),
                    child: Text("No ledger entries"),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLedgerRow(dynamic ledger, BuildContext context) {
    String invId = "";
    String date = "";

    // Check if it's opening balance
    if (ledger.isOpening == true) {
      invId = "Opn Bal";
      date = ""; // Empty for opening balance
    } else {
      invId = ledger.docNbr ?? "";
      if (ledger.docDate != null && ledger.docDate != "0001-01-01") {
        try {
          final parsedDate = DateTime.parse(ledger.docDate);
          date = DateFormat("dd-MMM-yyyy").format(parsedDate);
        } catch (e) {
          date = "";
        }
      }
    }

    return _buildTableRow([
      invId,
      date,
      ledger.drAmount?.toStringAsFixed(0) ?? "0",
      ledger.crAmount?.toStringAsFixed(0) ?? "0",
      ledger.balance?.toStringAsFixed(0) ?? "0",
    ], context);
  }

  Widget _buildTableRow(
    List<String> cells,
    BuildContext context, {
    bool isHeader = false,
  }) {
    return Row(
      children: [
        // Inv ID
        Expanded(flex: 2, child: _buildTableCell(cells[0], isHeader, context)),
        // Date
        Expanded(flex: 3, child: _buildTableCell(cells[1], isHeader, context)),
        // Dr
        Expanded(
          flex: 2,
          child: _buildTableCell(cells[2], isHeader, context, isAmount: true),
        ),
        // Cr
        Expanded(
          flex: 2,
          child: _buildTableCell(cells[3], isHeader, context, isAmount: true),
        ),
        // Balance
        Expanded(
          flex: 2,
          child: _buildTableCell(cells[4], isHeader, context, isAmount: true),
        ),
      ],
    );
  }

  Widget _buildTableCell(
    String text,
    bool isHeader,
    BuildContext context, {
    bool isAmount = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      color: isHeader ? null : Colors.white, // White background for data cells
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: context.displayLargeStyle!.copyWith(
          fontSize: isHeader ? 12 : 12,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: isHeader ? Colors.black87 : AppColors.greyTextColor,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildDateFilterPopup() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Text(
                "From Date",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),

              Obx(
                () => GestureDetector(
                  onTap: controller.pickFromDate,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: double.infinity,
                    child: Text(
                      controller.formatDate(controller.fromDate.value),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Text(
                "To Date",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Obx(
                () => GestureDetector(
                  onTap: controller.pickToDate,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: double.infinity,
                    child: Text(
                      controller.formatDate(controller.toDate.value),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Cancel",
                      fontsize: 13,
                      onPressed: () {
                        Get.back();
                      },
                      backgroundColor: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 15),

                  Expanded(
                    child: CustomButton(
                      text: "Apply",
                      fontsize: 13,
                      onPressed: () async {
                        Get.back();
                        await controller.getAccountStatements();
                      },
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
