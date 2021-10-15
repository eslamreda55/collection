abstract class ShopLoginStates {} 

class ShopLoginIntialStates extends ShopLoginStates {} 

class ShopLoginLoadingStates extends ShopLoginStates {} 

class ShopLoginSuccessStates extends ShopLoginStates {} 

class ShopLoginErrorStates extends ShopLoginStates {

  final String error;

  ShopLoginErrorStates(this.error);
  } 