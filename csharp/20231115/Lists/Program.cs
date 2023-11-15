using Exercise.One;

// List ( ex array )
// uses generics
// List<int> myList; // !NOTE: null
// the list is empty, can't be used directly after declaration
// needs to be initialized
// !NOTE: initializes to null
// must be created

// can be directly initialized
// class constructor
// var myList = new List<int>();

// can be directly initialized with length
// class constructor
// var myList = new List<int>(10);

// add data
// myList.Add(10);

// INDEX 0

// initialize with data
var myList = new List<int>() { 10, 20, 30, 40, 50 };

// read the list
// boomer method with for
// for (int i = 0; i < myList.Count; i++)
for (var i = 0; i < myList.Count; i++)
{
    Console.WriteLine(myList[i]);
}

// new method
// foreach (var item in myList)
// {
//     Console.WriteLine(item);
// }

// foreach (var item in myList)
// {
//     Console.WriteLine(item);
// }

// has lambdas
// myList.ForEach((item) => Console.WriteLine(item));
// !NOTE: has callbacks
// can be passed the param with callback
myList.ForEach(Console.WriteLine);

// common methods
// myList.Clear();

// get single item
Console.WriteLine($"myList[0]: {myList[0]}");

Console.WriteLine($"myList.Count: {myList.Count}");

// print the list in a single line
Console.WriteLine($"myList: {myList}");
Console.WriteLine($"myList: {string.Join(", ", myList)}");

// ex1
ExerciseOne.PrintTemps(ExerciseOne.GetTempsList());
