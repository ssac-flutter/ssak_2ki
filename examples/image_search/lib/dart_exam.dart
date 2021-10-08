import 'dart:math';

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Trader && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'Trader{name: $name, city: $city}';
  }
}

class Transaction implements Comparable<Transaction> {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Transaction &&
          runtimeType == other.runtimeType &&
          trader == other.trader;

  @override
  int get hashCode => trader.hashCode;

  @override
  String toString() {
    return 'Transaction{trader: $trader, year: $year, value: $value}';
  }

  @override
  int compareTo(Transaction other) {
    return value.compareTo(other.value);
  }
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

void main() {
  transactions.sort();
  transactions.forEach((element) { print(element.value); });

// 1. 2011년에 일어난 모든 트랜잭션을 찾아 값을 오름차순으로 정리하여 나열하시오
  print('1번 ============');
  (transactions
        ..sort((Transaction a, Transaction b) => a.value.compareTo(b.value)))
      .where((e) => e.year == 2011)
      .map((Transaction e) => e.value)
      .forEach(print);
  // .forEach((transaction) => print(transaction.value));

// 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오
  print('2번 ============');
  transactions.map((e) => e.trader.city).toSet().forEach(print);

// 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오
  print('3번 ============');
  (transactions
          .where((e) => e.trader.city == 'Cambridge')
          .map((e) => e.trader.name)
          .toList()
        ..sort()) // String, int, double
      .toSet()
      .forEach(print);

// 4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오
  print('4번 ============');
  (transactions.map((e) => e.trader.name).toList()
        ..sort()) // String, int, double
      .toSet()
      .forEach(print);

// 5. 밀라노에 거래자가 있는가?
  print('5번 ============');
  print(transactions.any((e) => e.trader.city == 'Milan'));

// 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오
  print('6번 ============');
  transactions.where((e) => e.trader.city == 'Cambridge').forEach((e) {
    print(e.value);
  });

// 7. 전체 트랜잭션 중 최대값을 얼마인가?
  print('7번 ============');
  print(transactions.map((e) => e.value).reduce((int a, int b) => max(a, b)));

// 8. 전체 트랜잭션 중 최소값은 얼마인가?
  print('8번 ============');
  print(transactions.map((e) => e.value).reduce((int a, int b) => min(a, b)));

  // print(transactions.reduce((a, b) => a.value > b.value ? a : b))

  print(transactions.fold<int>(0, (previousValue, element) => previousValue + element.value));

  print('===================');
  transactions
      .where((e) => e.trader.city == 'Cambridge')
      .toSet()
      .forEach((e) => print(e.trader.name));

}
