class bankCustomer {
  static int numberOfCust=0;
  static double totalBalance=0;
  int _id=0;
  String _Name;
  double _balance=0;
  

  bankCustomer(this._Name){
    _id++;
    numberOfCust = _id;
   
  }
  double getBalance(){
    return _balance;
  }
  void addToBalance(double money){
    _balance += money;
    totalBalance +=_balance;

  }
  bool substractIfPossible(double money){
    if(money>_balance){
      return false;
    }
    else {
      _balance -= money;
      totalBalance -=money;
      return true;
    }
  }
  static void printBankData(){
    print(totalBalance);
    print(numberOfCust);
  }

  String getName(){
    return _Name;
  }
}

void main(){
  var c1 = bankCustomer("Isaac Asimov");
  var c2 = bankCustomer("Ihsan Oktay Anar");
  var c3 = bankCustomer("Jose Saramago");
  var c4 = bankCustomer("Aldous Huxley");
  print(c1.getName());
  c1.addToBalance(341.5);
  c2.addToBalance(500);
  c3.addToBalance(233);
  print(c3.getBalance());
  print(c4.getBalance());
  bankCustomer.printBankData();
  c2.substractIfPossible(100);
  print(c2.getBalance());
  c3.substractIfPossible(300);
  print(c3.getBalance());
  bankCustomer.printBankData();
}