abstract class UseCase<Type, String> {
  Future <Type> call(String params);
}