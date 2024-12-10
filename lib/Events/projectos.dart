class Proyecto{
  String _titulo;
  String _autor;
  String _zona;
  String _box;
  String _nivelEstudios;
  String _resumen;
  String _imagenUrl;
  String _videoUrl;
  String _memoriaUrl;
  String _fotoAutorUrl;
  String _cvUrl;

  Proyecto(
      this._titulo,
      this._autor,
      this._zona,
      this._box,
      this._nivelEstudios,
      this._resumen,
      this._imagenUrl,
      this._videoUrl,
      this._memoriaUrl,
      this._fotoAutorUrl,
      this._cvUrl);

  String get cvUrl => _cvUrl;

  set cvUrl(String value) {
    _cvUrl = value;
  }

  String get fotoAutorUrl => _fotoAutorUrl;

  set fotoAutorUrl(String value) {
    _fotoAutorUrl = value;
  }

  String get memoriaUrl => _memoriaUrl;

  set memoriaUrl(String value) {
    _memoriaUrl = value;
  }

  String get videoUrl => _videoUrl;

  set videoUrl(String value) {
    _videoUrl = value;
  }

  String get imagenUrl => _imagenUrl;

  set imagenUrl(String value) {
    _imagenUrl = value;
  }

  String get resumen => _resumen;

  set resumen(String value) {
    _resumen = value;
  }

  String get nivelEstudios => _nivelEstudios;

  set nivelEstudios(String value) {
    _nivelEstudios = value;
  }

  String get box => _box;

  set box(String value) {
    _box = value;
  }

  String get zona => _zona;

  set zona(String value) {
    _zona = value;
  }

  String get autor => _autor;

  set autor(String value) {
    _autor = value;
  }

  String get titulo => _titulo;

  set titulo(String value) {
      _titulo = value;
    }
}
