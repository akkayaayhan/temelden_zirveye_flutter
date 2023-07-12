import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage extends StatefulWidget {
  const SecureStorage({super.key});

  @override
  State<SecureStorage> createState() => _SecureStorageState();
}

enum _SecureKeys { token }

class _SecureStorageState extends State<SecureStorage> {
  final _storage = FlutterSecureStorage();
  String _title = '';
  final TextEditingController _controller = TextEditingController();
  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSecureItems();
  }

  Future<void> getSecureItems() async {
    _title = await _storage.read(key: _SecureKeys.token.name) ?? '';

    if (_title.isNotEmpty) {
      print("bu adam önceden kullanmış api ve tokeni bu");
      _controller.text = _title;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await _storage.write(key: _SecureKeys.token.name, value: _title);
          },
          label: Text('Save')),
      body: TextField(
        controller: _controller,
        onChanged: saveItems,
        minLines: 3,
        maxLines: 4,
      ),
    );
  }
}
