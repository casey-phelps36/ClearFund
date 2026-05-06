import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'receipt_input_widget.dart' show ReceiptInputWidget;
import 'package:flutter/material.dart';

class ReceiptInputModel extends FlutterFlowModel<ReceiptInputWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataAbj = false;
  FFUploadedFile uploadedLocalFile_uploadDataAbj =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataAbj = '';

  // Stores action output result for [Gemini - Text From Image] action in Container widget.
  String? geminiResponse;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ReceiptsRecord? newReceiptRef;
  bool isDataUploading_uploadDataUpd = false;
  FFUploadedFile uploadedLocalFile_uploadDataUpd =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataUpd = '';

  // Stores action output result for [Gemini - Text From Image] action in Container widget.
  String? geminiResponseCopy;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ReceiptsRecord? newReceiptRefGallery;
  // Stores action output result for [Gemini - Generate Text] action in apitest widget.
  String? text;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
