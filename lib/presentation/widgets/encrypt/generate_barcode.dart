import 'package:flutter/material.dart';

class GenerateBarcode extends StatefulWidget {
  @override
  State<GenerateBarcode> createState() => _GenerateBarcodeState();
}

class _GenerateBarcodeState extends State<GenerateBarcode> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _assetName;
  late String _assetType;
  late String _valueToEncrypt;
  late String _valueToEncryptConfirm;
  late String _description;

  Widget _buildAssetName() {
    return TextFormField(
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero,
          labelText: 'Asset Name',
          border: OutlineInputBorder()),
      textAlign: TextAlign.center,
      validator: (String? value) {
        if (value?.isEmpty ?? true) {
          return 'Asset Name is required';
        }
      },
      onSaved: (String? value) {
        _assetName = value!;
      },
    );
  }

  Widget _buildAssetType() {
    return TextFormField(
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero,
          labelText: 'Asset Type',
          border: OutlineInputBorder()),
      textAlign: TextAlign.center,
      validator: (String? value) {
        if (value?.isEmpty ?? true) {
          return 'Asset Type is required';
        }
      },
      onSaved: (String? value) {
        _assetType = value!;
      },
    );
  }

  Widget _buildValueToEncrypt() {
    return TextFormField(
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero,
          labelText: 'Value to encrypt',
          border: OutlineInputBorder()),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textAlign: TextAlign.center,
      validator: (String? value) {
        if (value?.isEmpty ?? true) {
          return 'Value to encrypt is required';
        }
      },
      onSaved: (String? value) {
        _valueToEncrypt = value!;
      },
    );
  }

  Widget _buildValueToEncryptConfirm() {
    return TextFormField(
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero,
          labelText: 'Confirm value to encrypt',
          border: OutlineInputBorder()),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textAlign: TextAlign.center,
      validator: (String? value) {
        if (value?.isEmpty ?? true) {
          return 'Value to encrypt is required';
        }
      },
      onSaved: (String? value) {
        _valueToEncryptConfirm = value!;
      },
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.zero,
          labelText: 'Description',
          border: OutlineInputBorder()),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      onSaved: (String? value) {
        _description = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Container(
                decoration: const BoxDecoration(color: Colors.black),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildAssetName(),
                    const SizedBox(height: 16),
                    _buildAssetType(),
                    const SizedBox(height: 16),
                    _buildValueToEncrypt(),
                    const SizedBox(height: 16),
                    _buildValueToEncryptConfirm(),
                    const SizedBox(height: 100),
                    _buildDescription(),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          child: const Text('QR Code'),
                          onPressed: () => {},
                        ),
                        ElevatedButton(
                          child: const Text('BAR Code'),
                          onPressed: () => {},
                        )
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
