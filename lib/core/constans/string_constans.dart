class StringConstans {
  static StringConstans? _instace;
  static StringConstans get instance {
    _instace ??= StringConstans._init();
    return _instace!;
  }

  StringConstans._init();

  static const baseUrl = "https://reqres.in/";
}
