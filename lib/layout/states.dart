abstract class NewStates
{

}
class IntialStates extends NewStates
{

}
class ChangeBottom extends NewStates
{

}
class getdataBus extends NewStates
{

}
class LoadingBus extends NewStates
{

}
class Error extends NewStates
{
  final String error;

  Error(this.error);


}
//////////////////////////////////
class getdataSp extends NewStates
{

}
class LoadingSp extends NewStates
{

}
class ErrorSp extends NewStates
{
  final String error;

  ErrorSp(this.error);


}
////////////////////////////////////////
class getdataSet extends NewStates
{

}
class LoadingSet extends NewStates
{

}
class ErrorSet extends NewStates
{
  final String error;

  ErrorSet(this.error);


}
class ChangeDarkMode extends NewStates
{

}
class Getsearchh extends NewStates
{

}
class LoadingSearch extends NewStates
{

}
class ErrorSearch extends NewStates
{
  final String error;

  ErrorSearch(this.error);


}