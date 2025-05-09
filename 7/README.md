# Лабараторная работа №7

В ходе работы была изучена библиотека mappedbus, а также были запущены тестовые примеры  
Были запущены два ObjectWriter и один ObjectReader. ObjectWriter записывали сообщения в MemoryMappedFile, а ObjectReader считывал их и выводил в консоль.

### Результат работы ObjectWriter 1
```
$ java -cp mappedbus*.jar io.mappedbus.sample.object.ObjectWriter 0
```

### Результат работы ObjectWriter 2
```
$ java -cp mappedbus*.jar io.mappedbus.sa
```

### Результат работы ObjectReader
```
$ java -cp mappedbus*.jar io.mappedbus.sample.object.ObjectReader
Read: PriceUpdate [source=1, price=0, quantity=0], hasRecovered=false
Read: PriceUpdate [source=1, price=2, quantity=4], hasRecovered=false
Read: PriceUpdate [source=1, price=4, quantity=8], hasRecovered=false
Read: PriceUpdate [source=1, price=6, quantity=12], hasRecovered=false
Read: PriceUpdate [source=1, price=8, quantity=16], hasRecovered=false
Read: PriceUpdate [source=1, price=38, quantity=76], hasRecovered=false
Read: PriceUpdate [source=1, price=40, quantity=80], hasRecovered=false
Read: PriceUpdate [source=0, price=0, quantity=0], hasRecovered=false
Read: PriceUpdate [source=0, price=2, quantity=4], hasRecovered=false
Read: PriceUpdate [source=0, price=4, quantity=8], hasRecovered=false
Read: PriceUpdate [source=0, price=6, quantity=12], hasRecovered=false
Read: PriceUpdate [source=0, price=8, quantity=16], hasRecovered=false
Read: PriceUpdate [source=0, price=10, quantity=20], hasRecovered=false
```

Как можно заметить, ObjectReader считывает сообщения из двух разных источников.
