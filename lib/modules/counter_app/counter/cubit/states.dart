
abstract class CounterStates {}

class InitialCounterState extends CounterStates{}

class MinusState extends CounterStates{
  
  final int counter;
  MinusState(this.counter);
}

class PlusState extends CounterStates{
  
  final int counter;
  PlusState(this.counter);
}