/// KitchenSink.dart - A comprehensive demonstration of Dart language features
/// This file showcases all major Dart capabilities with explanations and examples
/// 
/// Author: DevRelopers
/// Version: 1.0.0
/// Dart SDK: 3.0+

// ============================================================================
// IMPORTS AND LIBRARIES
// ============================================================================

import 'dart:async';       // Asynchronous programming
import 'dart:collection';  // Collections framework
import 'dart:convert';     // Encoding/decoding (JSON, UTF-8, etc.)
import 'dart:io';          // I/O operations
import 'dart:math' as math; // Mathematical functions with prefix
import 'dart:typed_data';  // Fixed-size data sequences

// ============================================================================
// VARIABLES AND DATA TYPES
// ============================================================================

/// Demonstrates various variable declarations and data types
class VariablesDemo {
  // Compile-time constants
  static const String appName = 'Dart Kitchen Sink';
  static const int maxRetries = 3;
  static const double pi = 3.14159;
  static const bool isProduction = false;
  
  // Final variables (runtime constants)
  final DateTime createdAt = DateTime.now();
  final String id = _generateId();
  
  // Late initialization
  late String lazyLoadedData;
  late final int expensiveComputation;
  
  // Nullable types (null safety)
  String? nullableString;
  int? nullableInt;
  List<String>? nullableList;
  
  // Type inference with var
  var inferredString = 'Hello';  // Inferred as String
  var inferredInt = 42;          // Inferred as int
  var inferredList = <String>[]; // Inferred as List<String>
  
  // Dynamic type (avoid when possible)
  dynamic flexibleType;
  
  // Numbers
  int integer = 42;
  double floatingPoint = 3.14;
  num anyNumber = 100; // Can be int or double
  
  // BigInt for arbitrary precision
  BigInt bigInteger = BigInt.parse('12345678901234567890');
  
  // Hexadecimal, binary, and scientific notation
  int hex = 0xDEADBEEF;
  int binary = 0b11111111;
  double scientific = 1.42e5;
  
  static String _generateId() => DateTime.now().millisecondsSinceEpoch.toString();
  
  void demonstrateVariables() {
    print('=== Variables and Data Types ===');
    print('App Name: $appName');
    print('Max Retries: $maxRetries');
    print('Big Integer: $bigInteger');
    print('Hex value: ${hex.toRadixString(16)}');
    print('Binary value: ${binary.toRadixString(2)}');
    print('Scientific notation: $scientific');
  }
}

// ============================================================================
// COLLECTIONS
// ============================================================================

/// Demonstrates Dart's collection types and operations
class CollectionsDemo {
  // Lists (arrays)
  List<int> numbers = [1, 2, 3, 4, 5];
  List<String> names = ['Alice', 'Bob', 'Charlie'];
  final List<double> immutableList = const [1.0, 2.0, 3.0];
  List<dynamic> mixedList = [1, 'two', 3.0, true];
  
  // Sets (unique values)
  Set<String> uniqueNames = {'Alice', 'Bob', 'Charlie'};
  Set<int> primeNumbers = {2, 3, 5, 7, 11};
  
  // Maps (dictionaries/hash maps)
  Map<String, int> ages = {
    'Alice': 30,
    'Bob': 25,
    'Charlie': 35,
  };
  
  Map<int, String> indexedNames = {
    0: 'Zero',
    1: 'One',
    2: 'Two',
  };
  
  // Typed collections
  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];
  
  Map<String, List<String>> groupedData = {
    'fruits': ['apple', 'banana', 'orange'],
    'vegetables': ['carrot', 'lettuce', 'tomato'],
  };
  
  void demonstrateCollections() {
    print('\n=== Collections ===');
    
    // List operations
    numbers.add(6);
    numbers.addAll([7, 8, 9]);
    numbers.insert(0, 0);
    numbers.remove(5);
    numbers.removeAt(0);
    
    // Collection if and for
    var conditionalList = [
      'always',
      if (numbers.length > 5) 'conditional',
      for (int i in [1, 2, 3]) 'item_$i',
    ];
    
    // Spread operator
    var combined = [...numbers, ...primeNumbers];
    
    // Null-aware spread
    List<int>? nullableNumbers;
    var safeSpread = [...?nullableNumbers, 100];
    
    // Map operations
    ages['David'] = 28;
    ages.remove('Bob');
    ages.forEach((name, age) {
      print('$name is $age years old');
    });
    
    // Set operations
    var intersection = uniqueNames.intersection({'Alice', 'David'});
    var union = uniqueNames.union({'David', 'Eve'});
    var difference = uniqueNames.difference({'Bob'});
    
    // Collection methods
    var doubled = numbers.map((n) => n * 2).toList();
    var filtered = numbers.where((n) => n > 3).toList();
    var sum = numbers.reduce((a, b) => a + b);
    var hasEven = numbers.any((n) => n % 2 == 0);
    var allPositive = numbers.every((n) => n > 0);
    
    print('Doubled: $doubled');
    print('Filtered: $filtered');
    print('Sum: $sum');
    print('Has even: $hasEven');
    print('All positive: $allPositive');
  }
}

// ============================================================================
// FUNCTIONS
// ============================================================================

/// Demonstrates various function types and features
class FunctionsDemo {
  // Basic function
  int add(int a, int b) {
    return a + b;
  }
  
  // Expression function (arrow syntax)
  int multiply(int a, int b) => a * b;
  
  // Optional positional parameters
  String greet(String name, [String? title, int? age]) {
    var greeting = 'Hello';
    if (title != null) greeting = '$greeting $title';
    greeting = '$greeting $name';
    if (age != null) greeting = '$greeting, age $age';
    return greeting;
  }
  
  // Named parameters
  void createUser({
    required String name,
    required String email,
    int age = 18,
    bool isActive = true,
    String? phone,
  }) {
    print('Creating user: $name ($email)');
    print('Age: $age, Active: $isActive, Phone: ${phone ?? 'N/A'}');
  }
  
  // Function as first-class object
  Function getOperation(String op) {
    switch (op) {
      case '+':
        return (a, b) => a + b;
      case '-':
        return (a, b) => a - b;
      case '*':
        return (a, b) => a * b;
      case '/':
        return (a, b) => a / b;
      default:
        return (a, b) => 0;
    }
  }
  
  // Higher-order function
  List<T> filter<T>(List<T> list, bool Function(T) test) {
    var result = <T>[];
    for (var element in list) {
      if (test(element)) {
        result.add(element);
      }
    }
    return result;
  }
  
  // Anonymous functions and closures
  void demonstrateClosure() {
    var counter = 0;
    
    var increment = () {
      counter++;
      return counter;
    };
    
    var decrement = () => --counter;
    
    print('Counter: ${increment()}'); // 1
    print('Counter: ${increment()}'); // 2
    print('Counter: ${decrement()}'); // 1
  }
  
  // Generator functions
  Iterable<int> generateNumbers(int max) sync* {
    for (int i = 0; i < max; i++) {
      yield i;
    }
  }
  
  Stream<int> generateStream(int max) async* {
    for (int i = 0; i < max; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      yield i;
    }
  }
  
  // Recursive function
  int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
  }
  
  void demonstrateFunctions() {
    print('\n=== Functions ===');
    print('Add: ${add(5, 3)}');
    print('Multiply: ${multiply(4, 7)}');
    print('Greet: ${greet('Alice', 'Dr.', 30)}');
    
    createUser(name: 'Bob', email: 'bob@example.com', age: 25);
    
    var operation = getOperation('+');
    print('Dynamic operation: ${operation(10, 5)}');
    
    var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    var evens = filter(numbers, (n) => n % 2 == 0);
    print('Even numbers: $evens');
    
    print('Factorial of 5: ${factorial(5)}');
    
    demonstrateClosure();
  }
}

// ============================================================================
// CONTROL FLOW
// ============================================================================

/// Demonstrates control flow statements
class ControlFlowDemo {
  void demonstrateIfElse() {
    var score = 85;
    String grade;
    
    if (score >= 90) {
      grade = 'A';
    } else if (score >= 80) {
      grade = 'B';
    } else if (score >= 70) {
      grade = 'C';
    } else if (score >= 60) {
      grade = 'D';
    } else {
      grade = 'F';
    }
    
    print('Grade: $grade');
    
    // Ternary operator
    var status = score >= 60 ? 'Pass' : 'Fail';
    print('Status: $status');
    
    // Null-aware operators
    String? nullableValue;
    var result = nullableValue ?? 'default';
    print('Null-aware result: $result');
  }
  
  void demonstrateSwitch() {
    var command = 'start';
    
    switch (command) {
      case 'start':
        print('Starting application...');
        break;
      case 'stop':
        print('Stopping application...');
        break;
      case 'restart':
        print('Restarting application...');
        break;
      default:
        print('Unknown command');
    }
    
    // Switch expression (Dart 3.0+)
    var dayNumber = 3;
    var dayName = switch (dayNumber) {
      1 => 'Monday',
      2 => 'Tuesday',
      3 => 'Wednesday',
      4 => 'Thursday',
      5 => 'Friday',
      6 || 7 => 'Weekend',
      _ => 'Invalid',
    };
    print('Day: $dayName');
  }
  
  void demonstrateLoops() {
    // For loop
    print('For loop:');
    for (int i = 0; i < 5; i++) {
      print('  Iteration $i');
    }
    
    // For-in loop
    print('For-in loop:');
    var fruits = ['apple', 'banana', 'orange'];
    for (var fruit in fruits) {
      print('  Fruit: $fruit');
    }
    
    // While loop
    print('While loop:');
    int counter = 0;
    while (counter < 3) {
      print('  Counter: $counter');
      counter++;
    }
    
    // Do-while loop
    print('Do-while loop:');
    int value = 0;
    do {
      print('  Value: $value');
      value++;
    } while (value < 3);
    
    // Break and continue
    print('Break and continue:');
    for (int i = 0; i < 10; i++) {
      if (i == 3) continue; // Skip 3
      if (i == 7) break;    // Stop at 7
      print('  Number: $i');
    }
    
    // Labeled breaks
    outerLoop:
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (i == 1 && j == 1) {
          break outerLoop;
        }
        print('  Position: ($i, $j)');
      }
    }
  }
  
  void demonstrateAssert() {
    var value = 100;
    
    // Assertions (only in debug mode)
    assert(value > 0, 'Value must be positive');
    assert(value < 1000);
    
    print('Assertions passed');
  }
  
  void demonstrateControlFlow() {
    print('\n=== Control Flow ===');
    demonstrateIfElse();
    demonstrateSwitch();
    demonstrateLoops();
    demonstrateAssert();
  }
}

// ============================================================================
// CLASSES AND OBJECTS
// ============================================================================

/// Base class demonstrating class features
class Person {
  // Instance variables
  String name;
  int age;
  final String id;
  
  // Private variable (library-private)
  String _ssn;
  
  // Static variable
  static int population = 0;
  
  // Constructor
  Person(this.name, this.age, this._ssn) : id = _generateId() {
    population++;
  }
  
  // Named constructor
  Person.guest()
      : name = 'Guest',
        age = 0,
        _ssn = 'N/A',
        id = _generateId() {
    population++;
  }
  
  // Factory constructor
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      json['name'] as String,
      json['age'] as int,
      json['ssn'] as String,
    );
  }
  
  // Getters and setters
  String get displayName => name.toUpperCase();
  
  set displayName(String value) {
    name = value.toLowerCase();
  }
  
  bool get isAdult => age >= 18;
  
  // Methods
  void introduce() {
    print('Hi, I\'m $name and I\'m $age years old.');
  }
  
  void haveBirthday() {
    age++;
    print('$name is now $age years old!');
  }
  
  // Operator overloading
  bool operator >(Person other) => age > other.age;
  bool operator <(Person other) => age < other.age;
  bool operator ==(Object other) =>
      other is Person && other.id == id;
  
  @override
  int get hashCode => id.hashCode;
  
  // toString override
  @override
  String toString() => 'Person(name: $name, age: $age, id: $id)';
  
  // Static method
  static String _generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
  
  static void printPopulation() {
    print('Total population: $population');
  }
}

/// Inheritance example
class Employee extends Person {
  String department;
  double salary;
  
  Employee(String name, int age, String ssn, this.department, this.salary)
      : super(name, age, ssn);
  
  @override
  void introduce() {
    super.introduce();
    print('I work in $department and earn \$$salary');
  }
  
  void giveRaise(double percentage) {
    salary *= (1 + percentage / 100);
    print('$name got a raise! New salary: \$$salary');
  }
}

/// Abstract class
abstract class Shape {
  double get area;
  double get perimeter;
  void draw();
}

/// Interface implementation
class Circle implements Shape {
  final double radius;
  
  Circle(this.radius);
  
  @override
  double get area => math.pi * radius * radius;
  
  @override
  double get perimeter => 2 * math.pi * radius;
  
  @override
  void draw() {
    print('Drawing a circle with radius $radius');
  }
}

/// Mixin definition
mixin Flyable {
  double altitude = 0;
  
  void fly(double height) {
    altitude = height;
    print('Flying at altitude: $altitude');
  }
  
  void land() {
    altitude = 0;
    print('Landed safely');
  }
}

mixin Swimmable {
  double depth = 0;
  
  void swim(double d) {
    depth = d;
    print('Swimming at depth: $depth');
  }
}

/// Class using mixins
class Duck extends Person with Flyable, Swimmable {
  Duck(String name) : super(name, 1, 'N/A');
  
  void performTricks() {
    introduce();
    fly(100);
    swim(5);
    land();
  }
}

/// Extension methods
extension StringExtensions on String {
  String get reversed => split('').reversed.join('');
  
  bool get isPalindrome {
    var cleaned = toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    return cleaned == cleaned.reversed;
  }
  
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

/// Demonstrates classes and OOP
void demonstrateClasses() {
  print('\n=== Classes and Objects ===');
  
  // Creating instances
  var person = Person('Alice', 30, '123-45-6789');
  var guest = Person.guest();
  var employee = Employee('Bob', 25, '987-65-4321', 'IT', 75000);
  
  // Using methods
  person.introduce();
  person.haveBirthday();
  employee.introduce();
  employee.giveRaise(10);
  
  // Using properties
  print('${person.name} is adult: ${person.isAdult}');
  person.displayName = 'ALICE SMITH';
  print('Updated name: ${person.name}');
  
  // Static members
  Person.printPopulation();
  
  // Operator overloading
  print('Alice > Bob: ${person > employee}');
  
  // Polymorphism
  Shape circle = Circle(5);
  print('Circle area: ${circle.area}');
  circle.draw();
  
  // Mixins
  var duck = Duck('Donald');
  duck.performTricks();
  
  // Extensions
  var text = 'racecar';
  print('Is "$text" a palindrome? ${text.isPalindrome}');
  print('Reversed: ${text.reversed}');
  print('Capitalized: ${text.capitalize()}');
}

// ============================================================================
// GENERICS
// ============================================================================

/// Generic class
class Box<T> {
  T? _value;
  
  void put(T value) {
    _value = value;
  }
  
  T? get() => _value;
  
  bool get isEmpty => _value == null;
}

/// Generic with constraints
class NumberBox<T extends num> {
  final List<T> _numbers = [];
  
  void add(T number) {
    _numbers.add(number);
  }
  
  T? get max {
    if (_numbers.isEmpty) return null;
    return _numbers.reduce((a, b) => a > b ? a : b);
  }
  
  T? get min {
    if (_numbers.isEmpty) return null;
    return _numbers.reduce((a, b) => a < b ? a : b);
  }
  
  double get average {
    if (_numbers.isEmpty) return 0;
    var sum = _numbers.reduce((a, b) => (a + b) as T);
    return sum / _numbers.length;
  }
}

/// Generic function
T pickRandom<T>(List<T> items) {
  if (items.isEmpty) {
    throw ArgumentError('Cannot pick from empty list');
  }
  final random = math.Random();
  return items[random.nextInt(items.length)];
}

/// Generic method
class Utility {
  static List<T> reverse<T>(List<T> list) {
    return list.reversed.toList();
  }
  
  static Map<K, V> zipToMap<K, V>(List<K> keys, List<V> values) {
    if (keys.length != values.length) {
      throw ArgumentError('Lists must have same length');
    }
    var map = <K, V>{};
    for (int i = 0; i < keys.length; i++) {
      map[keys[i]] = values[i];
    }
    return map;
  }
}

void demonstrateGenerics() {
  print('\n=== Generics ===');
  
  // Generic class usage
  var stringBox = Box<String>();
  stringBox.put('Hello');
  print('String box: ${stringBox.get()}');
  
  var intBox = Box<int>();
  intBox.put(42);
  print('Int box: ${intBox.get()}');
  
  // Constrained generics
  var numberBox = NumberBox<double>();
  numberBox.add(3.14);
  numberBox.add(2.71);
  numberBox.add(1.41);
  print('Max: ${numberBox.max}');
  print('Min: ${numberBox.min}');
  print('Average: ${numberBox.average}');
  
  // Generic functions
  var colors = ['red', 'green', 'blue'];
  print('Random color: ${pickRandom(colors)}');
  
  var numbers = [1, 2, 3, 4, 5];
  print('Random number: ${pickRandom(numbers)}');
  
  // Generic methods
  print('Reversed: ${Utility.reverse(numbers)}');
  
  var keys = ['a', 'b', 'c'];
  var values = [1, 2, 3];
  print('Zipped map: ${Utility.zipToMap(keys, values)}');
}

// ============================================================================
// ASYNCHRONOUS PROGRAMMING
// ============================================================================

/// Demonstrates async/await and Futures
class AsyncDemo {
  // Basic async function
  Future<String> fetchData() async {
    print('Fetching data...');
    await Future.delayed(Duration(seconds: 1));
    return 'Data loaded successfully';
  }
  
  // Error handling in async
  Future<int> riskyOperation() async {
    await Future.delayed(Duration(milliseconds: 500));
    if (math.Random().nextBool()) {
      return 42;
    } else {
      throw Exception('Operation failed');
    }
  }
  
  // Multiple async operations
  Future<void> performMultipleOperations() async {
    try {
      // Sequential execution
      var result1 = await fetchData();
      print('Result 1: $result1');
      
      var result2 = await riskyOperation();
      print('Result 2: $result2');
      
      // Parallel execution
      var results = await Future.wait([
        fetchData(),
        fetchData(),
        fetchData(),
      ]);
      print('Parallel results: $results');
      
      // Race condition
      var fastest = await Future.any([
        Future.delayed(Duration(seconds: 3), () => 'Slow'),
        Future.delayed(Duration(seconds: 1), () => 'Fast'),
        Future.delayed(Duration(seconds: 2), () => 'Medium'),
      ]);
      print('Fastest result: $fastest');
      
    } catch (e) {
      print('Error: $e');
    } finally {
      print('Cleanup operations');
    }
  }
  
  // Stream operations
  Stream<int> countStream(int max) async* {
    for (int i = 0; i < max; i++) {
      await Future.delayed(Duration(milliseconds: 200));
      yield i;
    }
  }
  
  Future<void> consumeStream() async {
    print('Consuming stream:');
    await for (var value in countStream(5)) {
      print('  Received: $value');
    }
  }
  
  // Stream transformations
  Future<void> transformStream() async {
    var stream = countStream(5)
        .where((n) => n % 2 == 0)
        .map((n) => n * n)
        .take(2);
    
    await for (var value in stream) {
      print('  Transformed: $value');
    }
  }
  
  // Completer example
  Future<String> complexOperation() {
    var completer = Completer<String>();
    
    // Simulate async operation
    Timer(Duration(seconds: 1), () {
      if (math.Random().nextBool()) {
        completer.complete('Success!');
      } else {
        completer.completeError('Failed!');
      }
    });
    
    return completer.future;
  }
  
  // StreamController example
  void demonstrateStreamController() {
    var controller = StreamController<String>.broadcast();
    
    // Add listeners
    controller.stream.listen(
      (data) => print('Listener 1: $data'),
      onError: (error) => print('Listener 1 error: $error'),
      onDone: () => print('Listener 1 done'),
    );
    
    controller.stream.listen(
      (data) => print('Listener 2: $data'),
    );
    
    // Add data
    controller.add('First message');
    controller.add('Second message');
    controller.addError('Oops!');
    controller.add('Third message');
    controller.close();
  }
  
  Future<void> demonstrateAsync() async {
    print('\n=== Asynchronous Programming ===');
    
    var data = await fetchData();
    print('Fetched: $data');
    
    await performMultipleOperations();
    await consumeStream();
    await transformStream();
    
    demonstrateStreamController();
    
    try {
      var result = await complexOperation();
      print('Complex operation: $result');
    } catch (e) {
      print('Complex operation failed: $e');
    }
  }
}

// ============================================================================
// ERROR HANDLING
// ============================================================================

/// Custom exception
class ValidationException implements Exception {
  final String message;
  ValidationException(this.message);
  
  @override
  String toString() => 'ValidationException: $message';
}

/// Demonstrates error handling
class ErrorHandlingDemo {
  // Throwing exceptions
  void validateAge(int age) {
    if (age < 0) {
      throw ArgumentError('Age cannot be negative');
    }
    if (age > 150) {
      throw ValidationException('Age seems unrealistic');
    }
  }
  
  // Try-catch-finally
  void demonstrateTryCatch() {
    print('Try-catch-finally:');
    
    try {
      validateAge(-5);
    } on ArgumentError catch (e) {
      print('  Argument error: $e');
    } on ValidationException catch (e) {
      print('  Validation error: $e');
    } catch (e, stackTrace) {
      print('  Unknown error: $e');
      print('  Stack trace: $stackTrace');
    } finally {
      print('  Cleanup completed');
    }
  }
  
  // Rethrow
  void processWithRethrow() {
    try {
      validateAge(200);
    } catch (e) {
      print('  Logging error: $e');
      rethrow; // Propagate the error
    }
  }
  
  // Custom error handling
  Result<T> safeExecute<T>(T Function() operation) {
    try {
      var value = operation();
      return Result.success(value);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
  
  void demonstrateErrorHandling() {
    print('\n=== Error Handling ===');
    
    demonstrateTryCatch();
    
    try {
      processWithRethrow();
    } catch (e) {
      print('Caught rethrown error: $e');
    }
    
    var result = safeExecute(() => 10 ~/ 2);
    if (result.isSuccess) {
      print('Result: ${result.value}');
    }
    
    var errorResult = safeExecute(() => 10 ~/ 0);
    if (!errorResult.isSuccess) {
      print('Error: ${errorResult.error}');
    }
  }
}

/// Result type for error handling
class Result<T> {
  final T? value;
  final String? error;
  final bool isSuccess;
  
  Result.success(this.value)
      : error = null,
        isSuccess = true;
  
  Result.failure(this.error)
      : value = null,
        isSuccess = false;
}

// ============================================================================
// PATTERNS AND PATTERN MATCHING (Dart 3.0+)
// ============================================================================

/// Demonstrates pattern matching features
class PatternsDemo {
  void demonstratePatterns() {
    print('\n=== Patterns and Pattern Matching ===');
    
    // Destructuring
    var (a, b) = (1, 2);
    print('Destructured: a=$a, b=$b');
    
    var [first, second, ...rest] = [1, 2, 3, 4, 5];
    print('List destructuring: first=$first, second=$second, rest=$rest');
    
    var {'name': name, 'age': age} = {'name': 'Alice', 'age': 30};
    print('Map destructuring: name=$name, age=$age');
    
    // Pattern matching in switch
    var point = (2, 3);
    var description = switch (point) {
      (0, 0) => 'Origin',
      (var x, 0) => 'On X-axis at $x',
      (0, var y) => 'On Y-axis at $y',
      (var x, var y) when x == y => 'On diagonal at $x',
      (var x, var y) => 'Point at ($x, $y)',
    };
    print('Point description: $description');
    
    // Guards in patterns
    var value = 42;
    var category = switch (value) {
      < 0 => 'Negative',
      0 => 'Zero',
      > 0 && < 10 => 'Small positive',
      >= 10 && < 100 => 'Medium positive',
      _ => 'Large positive',
    };
    print('Value category: $category');
    
    // Pattern matching with objects
    var shape = Circle(5);
    var area = switch (shape) {
      Circle(radius: var r) => math.pi * r * r,
      _ => 0,
    };
    print('Shape area: $area');
    
    // Validation with patterns
    var json = {'name': 'Bob', 'age': 25};
    if (json case {'name': String name, 'age': int age}) {
      print('Valid person: $name, $age years old');
    }
  }
}

// ============================================================================
// ENUMS
// ============================================================================

/// Basic enum
enum Status { pending, approved, rejected }

/// Enhanced enum with members
enum HttpMethod {
  get('GET'),
  post('POST'),
  put('PUT'),
  delete('DELETE'),
  patch('PATCH');
  
  final String value;
  const HttpMethod(this.value);
  
  bool get isModifying => this == post || this == put || this == patch || this == delete;
}

/// Enum with mixins
mixin Describable {
  String get description;
}

enum Priority with Describable {
  low('Low priority task'),
  medium('Medium priority task'),
  high('High priority task'),
  critical('Critical priority task');
  
  final String _desc;
  const Priority(this._desc);
  
  @override
  String get description => _desc;
  
  int get weight {
    switch (this) {
      case Priority.low:
        return 1;
      case Priority.medium:
        return 2;
      case Priority.high:
        return 3;
      case Priority.critical:
        return 4;
    }
  }
}

void demonstrateEnums() {
  print('\n=== Enums ===');
  
  var status = Status.pending;
  print('Status: $status');
  print('Status index: ${status.index}');
  print('Status name: ${status.name}');
  
  // Switch with enum
  var message = switch (status) {
    Status.pending => 'Waiting for approval',
    Status.approved => 'Request approved',
    Status.rejected => 'Request rejected',
  };
  print('Message: $message');
  
  // Enhanced enum
  var method = HttpMethod.post;
  print('HTTP method: ${method.value}');
  print('Is modifying: ${method.isModifying}');
  
  // Enum with mixin
  var priority = Priority.high;
  print('Priority: ${priority.description}');
  print('Priority weight: ${priority.weight}');
  
  // Iterating enums
  print('All priorities:');
  for (var p in Priority.values) {
    print('  ${p.name}: ${p.description} (weight: ${p.weight})');
  }
}

// ============================================================================
// RECORDS (Dart 3.0+)
// ============================================================================

/// Demonstrates records feature
class RecordsDemo {
  // Function returning multiple values
  (int, String) getUserInfo() {
    return (42, 'Alice');
  }
  
  // Named fields in records
  ({int x, int y}) getCoordinates() {
    return (x: 10, y: 20);
  }
  
  // Mixed positional and named fields
  (String, String, {int age}) getPersonDetails() {
    return ('John', 'Doe', age: 30);
  }
  
  void demonstrateRecords() {
    print('\n=== Records ===');
    
    // Basic record
    var record = (1, 'hello', true);
    print('Record: $record');
    print('First element: ${record.$1}');
    print('Second element: ${record.$2}');
    print('Third element: ${record.$3}');
    
    // Destructuring records
    var (id, name) = getUserInfo();
    print('User: id=$id, name=$name');
    
    // Named fields
    var coords = getCoordinates();
    print('Coordinates: x=${coords.x}, y=${coords.y}');
    
    // Pattern matching with records
    var (firstName, lastName, age: userAge) = getPersonDetails();
    print('Person: $firstName $lastName, age $userAge');
    
    // Records in collections
    var points = [
      (0, 0),
      (1, 2),
      (3, 4),
    ];
    
    for (var (x, y) in points) {
      print('Point: ($x, $y)');
    }
    
    // Type annotations
    (int, int) point = (5, 10);
    ({String name, int score}) player = (name: 'Player1', score: 100);
    print('Point: $point');
    print('Player: ${player.name} - ${player.score}');
  }
}

// ============================================================================
// SEALED CLASSES (Dart 3.0+)
// ============================================================================

/// Sealed class hierarchy
sealed class Result2<T> {
  const Result2();
}

class Success<T> extends Result2<T> {
  final T value;
  const Success(this.value);
}

class Failure<T> extends Result2<T> {
  final String error;
  const Failure(this.error);
}

class Loading<T> extends Result2<T> {
  const Loading();
}

/// Using sealed classes
class SealedClassDemo {
  Result2<int> divideNumbers(int a, int b) {
    if (b == 0) {
      return Failure('Cannot divide by zero');
    }
    return Success(a ~/ b);
  }
  
  void demonstrateSealedClasses() {
    print('\n=== Sealed Classes ===');
    
    var results = [
      divideNumbers(10, 2),
      divideNumbers(10, 0),
      Loading<int>(),
    ];
    
    for (var result in results) {
      var message = switch (result) {
        Success(value: var v) => 'Success: $v',
        Failure(error: var e) => 'Error: $e',
        Loading() => 'Loading...',
      };
      print(message);
    }
  }
}

// ============================================================================
// ISOLATES
// ============================================================================

/// Demonstrates isolates for concurrent execution
class IsolateDemo {
  // Heavy computation to run in isolate
  static int fibonacci(int n) {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
  
  Future<void> demonstrateIsolates() async {
    print('\n=== Isolates ===');
    
    // Simple isolate
    print('Computing Fibonacci(40) in isolate...');
    var result = await Isolate.run(() => fibonacci(40));
    print('Fibonacci(40) = $result');
    
    // Isolate with send port
    var receivePort = ReceivePort();
    await Isolate.spawn(_isolateEntryPoint, receivePort.sendPort);
    
    // Listen for messages
    receivePort.listen((message) {
      print('Received from isolate: $message');
      if (message == 'done') {
        receivePort.close();
      }
    });
    
    // Multiple isolates
    var futures = <Future<int>>[];
    for (int i = 35; i <= 40; i++) {
      futures.add(Isolate.run(() => fibonacci(i)));
    }
    
    var results = await Future.wait(futures);
    print('Fibonacci results: $results');
  }
  
  static void _isolateEntryPoint(SendPort sendPort) {
    sendPort.send('Hello from isolate!');
    sendPort.send('Processing...');
    
    // Simulate work
    var sum = 0;
    for (int i = 0; i < 1000000; i++) {
      sum += i;
    }
    
    sendPort.send('Sum calculated: $sum');
    sendPort.send('done');
  }
}

// ============================================================================
// METADATA AND ANNOTATIONS
// ============================================================================

/// Custom annotation
class Todo {
  final String message;
  final String assignee;
  const Todo(this.message, {this.assignee = 'unassigned'});
}

/// Using annotations
class AnnotatedClass {
  @deprecated
  void oldMethod() {
    print('This method is deprecated');
  }
  
  @Todo('Implement this method', assignee: 'Alice')
  void futureMethod() {
    throw UnimplementedError();
  }
  
  @override
  String toString() => 'AnnotatedClass';
}

// ============================================================================
// TYPEDEFS
// ============================================================================

/// Type aliases
typedef IntList = List<int>;
typedef StringMap = Map<String, String>;
typedef Compare<T> = int Function(T a, T b);
typedef AsyncCallback = Future<void> Function();
typedef JsonMap = Map<String, dynamic>;

class TypedefDemo {
  void demonstrateTypedefs() {
    print('\n=== Typedefs ===');
    
    IntList numbers = [1, 2, 3, 4, 5];
    print('Numbers: $numbers');
    
    StringMap config = {
      'host': 'localhost',
      'port': '8080',
    };
    print('Config: $config');
    
    Compare<int> compareInts = (a, b) => a.compareTo(b);
    var sorted = [...numbers]..sort(compareInts);
    print('Sorted: $sorted');
    
    AsyncCallback saveData = () async {
      await Future.delayed(Duration(milliseconds: 100));
      print('Data saved!');
    };
    saveData();
    
    JsonMap json = {
      'name': 'Alice',
      'age': 30,
      'scores': [95, 87, 92],
    };
    print('JSON: $json');
  }
}

// ============================================================================
// MAIN FUNCTION - Entry Point
// ============================================================================

/// Main function with command-line arguments
void main(List<String> arguments) {
  print('╔════════════════════════════════════════════════════════════════╗');
  print('║           DART KITCHEN SINK - Complete Feature Demo           ║');
  print('╚════════════════════════════════════════════════════════════════╝');
  
  // Command-line arguments
  if (arguments.isNotEmpty) {
    print('\nCommand-line arguments received:');
    arguments.asMap().forEach((index, arg) {
      print('  Arg $index: $arg');
    });
  }
  
  // Run all demonstrations
  VariablesDemo().demonstrateVariables();
  CollectionsDemo().demonstrateCollections();
  FunctionsDemo().demonstrateFunctions();
  ControlFlowDemo().demonstrateControlFlow();
  demonstrateClasses();
  demonstrateGenerics();
  AsyncDemo().demonstrateAsync();
  ErrorHandlingDemo().demonstrateErrorHandling();
  PatternsDemo().demonstratePatterns();
  demonstrateEnums();
  RecordsDemo().demonstrateRecords();
  SealedClassDemo().demonstrateSealedClasses();
  IsolateDemo().demonstrateIsolates();
  TypedefDemo().demonstrateTypedefs();
  
  // Using platform features
  demonstratePlatformFeatures();
  
  print('\n╔════════════════════════════════════════════════════════════════╗');
  print('║                    Demo Complete!                              ║');
  print('╚════════════════════════════════════════════════════════════════╝');
}

/// Platform-specific features
void demonstratePlatformFeatures() {
  print('\n=== Platform Features ===');
  
  // Environment variables
  var home = Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];
  print('Home directory: $home');
  
  // Platform information
  print('Operating System: ${Platform.operatingSystem}');
  print('Dart version: ${Platform.version}');
  print('Executable: ${Platform.executable}');
  print('Script: ${Platform.script}');
  
  // Working with URIs
  var uri = Uri.parse('https://example.com/api/users?page=1&limit=10');
  print('URI host: ${uri.host}');
  print('URI path: ${uri.path}');
  print('URI query: ${uri.queryParameters}');
  
  // Date and time
  var now = DateTime.now();
  var formatted = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  print('Current date: $formatted');
  
  var duration = Duration(days: 1, hours: 2, minutes: 30);
  var future = now.add(duration);
  print('Future date: $future');
  
  // Regular expressions
  var emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
  var email = 'user@example.com';
  print('Is "$email" valid? ${emailRegex.hasMatch(email)}');
  
  // String buffer for efficient string building
  var buffer = StringBuffer();
  buffer.write('Hello');
  buffer.write(' ');
  buffer.write('World');
  buffer.writeln('!');
  print('Buffer result: ${buffer.toString()}');
}

// ============================================================================
// ADVANCED CONCEPTS
// ============================================================================

/// Demonstrates zone concept for error handling and context
void demonstrateZones() {
  print('\n=== Zones ===');
  
  // Custom zone with error handler
  runZonedGuarded(() {
    print('Running in custom zone');
    throw Exception('Test exception');
  }, (error, stack) {
    print('Zone caught error: $error');
  });
  
  // Zone with values
  runZoned(() {
    var value = Zone.current['key'];
    print('Zone value: $value');
  }, zoneValues: {'key': 'custom value'});
}

/// Demonstrates weak references
void demonstrateWeakReferences() {
  print('\n=== Weak References ===');
  
  var object = Person('Temporary', 25, '000-00-0000');
  var weakRef = WeakReference(object);
  
  print('Weak reference target: ${weakRef.target}');
  
  // Object may be garbage collected if no strong references exist
  object = Person('New', 30, '111-11-1111');
  
  // Target might be null after GC
  print('Weak reference after reassignment: ${weakRef.target}');
}

/// Demonstrates symbols and reflection concepts
void demonstrateSymbols() {
  print('\n=== Symbols ===');
  
  // Symbols are compile-time constants
  const nameSymbol = #name;
  const ageSymbol = #age;
  
  print('Name symbol: $nameSymbol');
  print('Age symbol: $ageSymbol');
  
  // Symbols are useful for reflection (when available)
  var symbols = [#firstName, #lastName, #email];
  for (var symbol in symbols) {
    print('Symbol: $symbol');
  }
}

// ============================================================================
// END OF KITCHEN SINK
// ============================================================================