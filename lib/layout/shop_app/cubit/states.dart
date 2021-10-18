abstract class ShopStates{}

class ShopIntialState extends ShopStates{}

class ShopChangeBtNavState extends ShopStates{}

class ShopLoadingState extends ShopStates{}

class ShopErrorState extends ShopStates{
  final String error;

  ShopErrorState(this.error);

}



