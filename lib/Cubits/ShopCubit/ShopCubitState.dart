abstract class ShopCubitState{}

class ShopIntialState extends ShopCubitState{}
class ShopLoadingState extends ShopCubitState{}
class ShopSuccessState extends ShopCubitState{}
class ShopFaliureState extends ShopCubitState{
  final String msgError;
  ShopFaliureState(this.msgError);
}
class ShopChangeNavigtor extends ShopCubitState{}
class ShopSuccessIsliked extends ShopCubitState{}
class ShopErrorIsliked extends ShopCubitState{}
class ShopGetCatageorySuccess  extends ShopCubitState{}
class ShopGetCatageoryFaliure  extends ShopCubitState{}
class ShopGetFavouriteSucces  extends ShopCubitState{}
class ShopGetFavouriteError  extends ShopCubitState{}
class ShopGetFavouriteLoading  extends ShopCubitState{}
class ShopGetProfileSuccess  extends ShopCubitState{}
class ShopGetProfileError  extends ShopCubitState{}
