// actor {
//   public query func greet(name : Text) : async Text {
//     return "Hello, " # name # "!";
//   };
// };

// 1st Create class which will hold canister

// 2nd import print module to use it
import Debug "mo:base/Debug";

actor DBank {
  var currentValue = 300;
  currentValue := 100;

  let id = 43935151587239489374;

  Debug.print("Hello");
  Debug.print(debug_show(currentValue));
  Debug.print(debug_show(id));

// Private function - accessible only within this DBank actor
// Add "public" keyword to make it accessible outside DBank actor
// topUp(value: datatype)
  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  // topUp();

  // Allow users to withdraw an amount from currentValue
  // Decrease the currentValue by the amount
  public func withDraw(amount: Nat) {
    let tempValue: Int = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount too large, currentValue less than zero.");
    }
  }
}