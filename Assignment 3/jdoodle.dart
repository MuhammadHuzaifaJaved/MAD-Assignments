import 'dart:io';

// Simple event-based console app demonstrating interaction patterns
class InteractiveApp {
  String _backgroundColor = 'white';
  final String _originalColor = 'white';
  String _currentText = '';
  
  void start() {
    print('=== Welcome to the Interactive Event-Based App! ===\n');
    showMenu();
    
    while (true) {
      stdout.write('\nEnter your choice: ');
      String? input = stdin.readLineSync();
      
      if (input == null) continue;
      
      switch (input.toLowerCase()) {
        case '1':
          handleButtonClick();
          break;
        case '2':
          handleLongPress();
          break;
        case '3':
          handleReset();
          break;
        case '4':
          handleSingleTap();
          break;
        case '5':
          handleDoubleTap();
          break;
        case '6':
          handleTextInput();
          break;
        case '7':
          showCurrentState();
          break;
        case 'menu':
        case 'm':
          showMenu();
          break;
        case 'quit':
        case 'q':
          print('Thanks for using the Interactive App! Goodbye!');
          return;
        default:
          print('Invalid choice. Type "menu" to see options or "quit" to exit.');
      }
    }
  }
  
  void showMenu() {
    print('--- Interactive Menu ---');
    print('1. Click Me Button');
    print('2. Long Press Me Button');
    print('3. Reset Button');
    print('4. Single Tap Gesture');
    print('5. Double Tap Gesture');
    print('6. Text Input Demo');
    print('7. Show Current State');
    print('Type "menu" or "m" to show this menu');
    print('Type "quit" or "q" to exit');
    print('------------------------');
  }
  
  void handleButtonClick() {
    print('🎉 Event: Button Clicked!');
    showSnackbar('Button was clicked successfully!');
  }
  
  void handleLongPress() {
    print('🔄 Event: Long Press Detected!');
    changeBackgroundColor();
    showSnackbar('Background color changed due to long press!');
  }
  
  void handleReset() {
    print('↩️  Event: Reset Triggered!');
    resetBackground();
    showSnackbar('Background reset to original color!');
  }
  
  void handleSingleTap() {
    print('👆 Event: Single Tap Gesture Detected!');
    showSnackbar('You performed a single tap gesture!');
  }
  
  void handleDoubleTap() {
    print('👆👆 Event: Double Tap Gesture Detected!');
    showSnackbar('You performed a double tap gesture!');
  }
  
  void handleTextInput() {
    print('\n--- Text Input Demo ---');
    print('Start typing (press Enter to submit, type "back" to return to menu):');
    
    while (true) {
      stdout.write('> ');
      String? input = stdin.readLineSync();
      
      if (input == null) continue;
      
      if (input.toLowerCase() == 'back') {
        print('Returning to main menu...\n');
        break;
      }
      
      // Simulate onChanged event
      onTextChanged(input);
      
      if (input.isNotEmpty) {
        // Simulate onSubmitted event
        onTextSubmitted(input);
      }
    }
  }
  
  void onTextChanged(String text) {
    _currentText = text;
    print('📝 Live Input: "$text"');
  }
  
  void onTextSubmitted(String text) {
    print('✅ Text Submitted: "$text"');
    showSnackbar('Text "$text" was submitted successfully!');
  }
  
  void changeBackgroundColor() {
    if (_backgroundColor == _originalColor) {
      _backgroundColor = 'light blue';
    } else if (_backgroundColor == 'light blue') {
      _backgroundColor = 'light green';
    } else {
      _backgroundColor = 'light blue';
    }
    print('🎨 Background color changed to: $_backgroundColor');
  }
  
  void resetBackground() {
    _backgroundColor = _originalColor;
    print('🎨 Background color reset to: $_backgroundColor');
  }
  
  void showSnackbar(String message) {
    print('📢 Notification: $message');
  }
  
  void showCurrentState() {
    print('\n--- Current App State ---');
    print('Background Color: $_backgroundColor');
    print('Current Text: ${_currentText.isEmpty ? "(empty)" : _currentText}');
    print('Original Color: $_originalColor');
    print('-------------------------\n');
  }
}

// Demonstration of Flutter-like event handling concepts
class EventHandler {
  // Simulates Flutter's onPressed callback
  static void onPressed(Function callback) {
    print('🎯 Executing onPressed callback...');
    callback();
  }
  
  // Simulates Flutter's onLongPress callback
  static void onLongPress(Function callback) {
    print('🎯 Executing onLongPress callback...');
    callback();
  }
  
  // Simulates Flutter's onTap callback
  static void onTap(Function callback) {
    print('🎯 Executing onTap callback...');
    callback();
  }
  
  // Simulates Flutter's onDoubleTap callback
  static void onDoubleTap(Function callback) {
    print('🎯 Executing onDoubleTap callback...');
    callback();
  }
  
  // Simulates Flutter's onChanged callback
  static void onChanged(String value, Function(String) callback) {
    print('🎯 Executing onChanged callback...');
    callback(value);
  }
  
  // Simulates Flutter's onSubmitted callback
  static void onSubmitted(String value, Function(String) callback) {
    print('🎯 Executing onSubmitted callback...');
    callback(value);
  }
}

// Example usage of event handling patterns
void demonstrateEventPatterns() {
  print('\n=== Event Handling Pattern Demonstration ===\n');
  
  // Button click event
  EventHandler.onPressed(() {
    print('Button was clicked!');
  });
  
  // Long press event
  EventHandler.onLongPress(() {
    print('Long press action executed!');
  });
  
  // Gesture events
  EventHandler.onTap(() {
    print('Single tap gesture!');
  });
  
  EventHandler.onDoubleTap(() {
    print('Double tap gesture!');
  });
  
  // Text input events
  EventHandler.onChanged('Hello', (value) {
    print('Text changed to: $value');
  });
  
  EventHandler.onSubmitted('Hello World', (value) {
    print('Text submitted: $value');
  });
  
  print('\n=== End of Pattern Demonstration ===\n');
}

void main() {
  print('🚀 Starting Interactive Event-Based App...\n');
  
  // First, demonstrate the event handling patterns
  demonstrateEventPatterns();
  
  // Then run the interactive app
  InteractiveApp app = InteractiveApp();
  app.start();
}