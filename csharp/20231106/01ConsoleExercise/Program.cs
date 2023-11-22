// imports
using ConsoleExercise.Exercise2;

Exercise2.SayHello();

Console.WriteLine("Hello, World!");

var newTriangle = new ConsoleExercise.Triangle(10, 5);

Console.WriteLine(newTriangle.GetArea());

// ask base and height from user then create a triangle and print its area
var methods = new ConsoleExercise.Methods();

var (triangleBaseInput, triangleHeightInput) = methods.GetTriangleInputs();

if (triangleBaseInput != 0 || triangleHeightInput != 0) {
    var triangleInput2Area = new ConsoleExercise.Triangle(
        triangleBaseInput,
        triangleHeightInput
    ).GetArea();

    Console.WriteLine($"Triangle area is {triangleInput2Area}");
}

namespace ConsoleExercise {
    internal class Triangle {
        private readonly double triangleBase;
        private readonly double triangleHeight;

        public Triangle(double triangleBase, double triangleHeight) {
            this.triangleBase = triangleBase;
            this.triangleHeight = triangleHeight;
        }

        public double GetArea() => this.triangleBase * this.triangleHeight / 2;
    };

    internal class Methods {
        public T GetInput<T>(string message) {
            try {
                Console.WriteLine(message + "(q to quit)");
                var input = Console.ReadLine();
                if (input == "q") {
                    Console.WriteLine("Exiting...");
                    return default(T);
                }

                var parsedInput = Convert.ToDouble(input);

                return (T)Convert.ChangeType(parsedInput, typeof(T));
            } catch (Exception e) {
                Console.WriteLine(e.Message);
                throw new Exception("Error parsing input");
            } finally {
                Console.WriteLine("Finally block");
            }
        }

        public (double, double) GetTriangleInputs() {
            try {
                var triangleHeightInput = this.GetInput<double>("Enter triangle height: ");
                var triangleBaseInput = this.GetInput<double>("Enter triangle base: ");

                return (triangleHeightInput, triangleBaseInput);
            } catch (Exception e) {
                Console.WriteLine("Error parsing input");
                return (0, 0);
            }
        }
    }

    // public static class Exercise {
    //     public static void Main() {
    //         Console.WriteLine("Hello World!");

    //         const double a = 1.00;
    //         const double b = 2.00;

    //         Console.WriteLine(a + b);
    //     }
    // }
}
