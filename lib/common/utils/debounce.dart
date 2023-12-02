import 'dart:async';

// Define a function named debounce that takes a function and a duration as parameters
void debounce(Function() action, int duration) {
  // Declare a nullable Timer variable named timer
  Timer? timer;

  // Define a nested function named execute
  void execute() {
    // Cancel the timer if it's not null
    timer?.cancel();
    // Set the timer to a new Timer with the specified duration and action as the callback
    timer = Timer(Duration(milliseconds: duration), action);
  }

  // Call the execute function immediately when debounce is called
  execute();
}

