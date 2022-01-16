class Role {

  static String _type = '';

  static int _turn = -1;

  static String get type => _type;

  static set type(String value) {
    _type = value;
  }

  static int get turn => _turn;

  static set turn(int value) {
    _turn = value;
  }
}