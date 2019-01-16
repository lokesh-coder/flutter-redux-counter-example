class Counter{
  int currentValue;

  Counter({this.currentValue});

  factory Counter.increase(int newCounterValue){
    return Counter(currentValue: newCounterValue);
  }
}