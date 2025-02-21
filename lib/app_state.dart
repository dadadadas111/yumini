import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _geminiApiKey =
          await secureStorage.getString('ff_geminiApiKey') ?? _geminiApiKey;
    });
    await _safeInitAsync(() async {
      _isNavOpen = await secureStorage.getBool('ff_isNavOpen') ?? _isNavOpen;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _systemMessage = 'You tell dad jokes all the time.';
  String get systemMessage => _systemMessage;
  set systemMessage(String value) {
    _systemMessage = value;
  }

  String _prompt = '';
  String get prompt => _prompt;
  set prompt(String value) {
    _prompt = value;
  }

  List<MessageStruct> _chat = [];
  List<MessageStruct> get chat => _chat;
  set chat(List<MessageStruct> value) {
    _chat = value;
  }

  void addToChat(MessageStruct value) {
    chat.add(value);
  }

  void removeFromChat(MessageStruct value) {
    chat.remove(value);
  }

  void removeAtIndexFromChat(int index) {
    chat.removeAt(index);
  }

  void updateChatAtIndex(
    int index,
    MessageStruct Function(MessageStruct) updateFn,
  ) {
    chat[index] = updateFn(_chat[index]);
  }

  void insertAtIndexInChat(int index, MessageStruct value) {
    chat.insert(index, value);
  }

  String _geminiApiKey = 'LMAO NOPE. NICE TRY.';
  String get geminiApiKey => _geminiApiKey;
  set geminiApiKey(String value) {
    _geminiApiKey = value;
    secureStorage.setString('ff_geminiApiKey', value);
  }

  void deleteGeminiApiKey() {
    secureStorage.delete(key: 'ff_geminiApiKey');
  }

  bool _isBotSelected = false;
  bool get isBotSelected => _isBotSelected;
  set isBotSelected(bool value) {
    _isBotSelected = value;
  }

  String _selectedBot = '';
  String get selectedBot => _selectedBot;
  set selectedBot(String value) {
    _selectedBot = value;
  }

  String _selectedBotName = '';
  String get selectedBotName => _selectedBotName;
  set selectedBotName(String value) {
    _selectedBotName = value;
  }

  bool _isNavOpen = false;
  bool get isNavOpen => _isNavOpen;
  set isNavOpen(bool value) {
    _isNavOpen = value;
    secureStorage.setBool('ff_isNavOpen', value);
  }

  void deleteIsNavOpen() {
    secureStorage.delete(key: 'ff_isNavOpen');
  }

  String _selectedBotPhoto = '';
  String get selectedBotPhoto => _selectedBotPhoto;
  set selectedBotPhoto(String value) {
    _selectedBotPhoto = value;
  }

  String _oldBot = '';
  String get oldBot => _oldBot;
  set oldBot(String value) {
    _oldBot = value;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
  }

  bool _isExitHover = false;
  bool get isExitHover => _isExitHover;
  set isExitHover(bool value) {
    _isExitHover = value;
  }

  int _DailinEmote = 6;
  int get DailinEmote => _DailinEmote;
  set DailinEmote(int value) {
    _DailinEmote = value;
  }

  bool _isChatting = false;
  bool get isChatting => _isChatting;
  set isChatting(bool value) {
    _isChatting = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
