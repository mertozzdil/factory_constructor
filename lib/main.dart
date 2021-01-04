class Person {
  int id;
  String name;
  static final Map<int, Person> _cache = {};

  //named constructor
  Person._createInstance(this.id, this.name);

  //factory constructor
  factory Person(int id, String name) {
    if (!_cache.containsKey(id)) {           // <-- böylece aynı id'de farklı bir nesne oluşturulmasının önüne geçilir
      print('Creating new instance with id $id');

      var instance = Person._createInstance(id, name);  // named constructor ile örnek oluşturuluyor
      _cache[id] = instance;                            //  örnek, id key'ine value olarak atanıyor
    }

    return _cache[id];                                  //class'ın örneği burada döndürülüyor
  }


  // string representation
  @override
  String toString() {
    return 'id: ${this.id}, name: ${this.name}';
  }
}

void main() {
  // create `Person` object with id `1`
  Person p1 = Person(1, 'John');                        // burada factory constructor'ı ile nesne oluşturuluyor
  print('p1 : $p1');                                    // ve örnekte görüldüğü gibi aynı id'den yeni nesne oluşturmaya
                                                        // çalışılınca ilk oluşturulan nesneyi tekrar döndürüyor
  // create another `Person` object with id `1`         // böylece örnek oluşumu kontrol altında tutuluyor
  Person p2 = Person(1, 'Mike');
  print('p2 : $p2');

  // create `Person` object with id `2`
  Person p3 = Person(2, 'Mike');
  print('p3 : $p3');
}
