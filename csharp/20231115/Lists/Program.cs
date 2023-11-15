using System.Text.Json.Serialization;
using Exercise.One;
using Newtonsoft.Json;

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
ExerciseOne.PrintTemps(
    ExerciseOne.GetTempsList(ExerciseOne.GetInput("How many temperatures do you want to enter?"))
);

// ex2

var randomList = new List<int>() { 10, 20, 30, 40, 50 };

// get avg
var randomListAvg = randomList.Aggregate((acc, item) => acc + item) / randomList.Count;

// get max and min
var minMaxObj = randomList.Aggregate(
    new Lists.MinMax() { Min = int.MaxValue, Max = int.MinValue },
    (acc, item) =>
        new Lists.MinMax()
        {
            Min = item < acc.Min ? item : acc.Min,
            Max = item > acc.Max ? item : acc.Max
        }
);

Console.WriteLine(JsonConvert.SerializeObject(minMaxObj));

Console.WriteLine($"randomListAvg: {randomListAvg}");

namespace Lists
{
    public struct MinMax
    {
        public int Min { get; set; }
        public int Max { get; set; }
    }
}
