const string name = "John";

const string subname = name;

Console.WriteLine(subname);

// string? username;

try
{
    // username = Console.ReadLine();
    // if (username == null || username.Length == 0) {
    //     throw new InvalidOperationException("username is empty");
    // }
    // Console.WriteLine($"Hello {username}!");
    Console.WriteLine($"Hello!");
}
catch (Exception e)
{
    Console.WriteLine("error");
    Console.WriteLine(e);
}

Console.WriteLine($"Hello {name}!");

// loops
for (var i = 0; i < 10; i++)
{
    Console.WriteLine(i);
}

string[] cars = { "Volvo", "BMW", "Ford", "Mazda" };

foreach (var car in cars)
{
    Console.WriteLine(car);
    if (car == "Ford")
    {
        break;
    }
}

var test = new Intro.Program.Test("blue");
Console.WriteLine(test.Color);

var sum = Intro.Program.Test.AddTwoNumbers(1, 2);
Console.WriteLine(sum);

namespace Intro.Program
{
    internal class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }
    }

    public class Test
    {
        public Test(string color) => this.Color = color;

        public string Color { get; set; }

        public static int AddTwoNumbers(int a, int b)
        {
            var sum = a + b;
            Console.WriteLine(sum);
            return sum;
        }
    }
}
