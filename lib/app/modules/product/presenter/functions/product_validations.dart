class ProductValidations {
  String? name(String value) {
    return value.length < 3 ? 'Nome inválido' : null;
  }

  String? regularPrice(String value) {
    return value.isEmpty ? 'Preço inválido' : null;
  }
}
