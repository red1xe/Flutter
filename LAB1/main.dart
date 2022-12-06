import 'dart:io';
void main() {

  print("Please Enter Number");
  int n = int.parse(stdin.readLineSync()!);

  if(isPrime(n)){
    print(n.toString() + " is a prime number.");
  }else{
    print(n.toString() + " is not a prime number.");
  }

}

bool isPrime(N) {
  for(int i = 2;i<N;i++) {
    if(N % i == 0) {
      return false;
    }
  }
  return true;
}
