
// Here i create the class name Apiresponse just it response the data, error, erorr message

class APIResponse<T> {
  T? data;
  bool? error;
  String? errorMessage;

  APIResponse( { this.data,  this.errorMessage,this.error=false});
}