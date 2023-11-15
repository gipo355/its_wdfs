using System;

// See https://aka.ms/new-console-template for more information
Console.WriteLine("Hello, World!");

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
// myList.ForEach((item) => Console.WriteLine(item));
myList.ForEach(Console.WriteLine);

Console.WriteLine($"myList.Count: {myList.Count}");

// log the list
Console.WriteLine($"myList: {myList}");
