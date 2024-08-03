import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:rationshopproject/presentation/owner/qr%20code%20scanner.dart';
import '../common/user or owner selection.dart';

class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  String _barcode = 'Unknown';

  @override
  void initState() {
    super.initState();
    _scanBarcode(); // Automatically trigger barcode scanning when the app starts
  }

  Future<void> _scanBarcode() async {
    try {
      String barcode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.DEFAULT,
      );

      setState(() {
        _barcode = barcode;
      });
      if (barcode == '-1') {
        // User cancelled scanning, navigate to another screen or perform any action
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => user_owner_selection(),
          ),
        );
        return; // Exit the method if user cancels
      }
      // Navigate to the next screen after scanning
      if (_barcode.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Scan_qr(
              data: _barcode,
            ),
          ),
        );
      }
    } on PlatformException catch (e) {
      print("Error scanning barcode: ${e.message}");
      setState(() {
        _barcode = 'Failed to scan barcode';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
