import 'package:flutter/material.dart';
import 'package:temelden_zirveye_flutter/day12_shared_preferences_secure_jwt_cache/shared_manager.dart';
import 'package:temelden_zirveye_flutter/day12_shared_preferences_secure_jwt_cache/user_model.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;

  late final List<User> userItems;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    userItems = UserItems().users;
    _initialize();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();
    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [_loading(context)],
      ),
      floatingActionButton: Row(mainAxisSize: MainAxisSize.min, children: [
        FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () async {
            changeLoading();
            await _manager.saveString(
                SharedKeys.counter, _currentValue.toString());
            changeLoading();
          },
        ),
        FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () async {
              changeLoading();
              await _manager.removeItem(SharedKeys.counter);
              changeLoading();
            })
      ]),
      body: Column(children: [
        TextField(
          onChanged: (value) {
            _onChangeValue(value);
          },
        )
      ]),
    );
  }

  SingleChildRenderObjectWidget _loading(BuildContext context) => isLoading
      ? Center(
          child: CircularProgressIndicator(
              color: Theme.of(context).scaffoldBackgroundColor),
        )
      : SizedBox.shrink();
}

class UserItems {
  late final List<User> users;
  UserItems() {
    users = [
      User('ayhan', 'akkaya', '38'),
      User('meral', 'kaz', '30'),
      User('emine', 'akkaya', '5'),
      User('adil', 'altun', '40'),
    ];
  }
}

abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
