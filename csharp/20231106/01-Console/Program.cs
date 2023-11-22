namespace InitialConsole;

public static class Program {
    public static void Main() {
        Console.WriteLine("Hello World!");

        const double a = 1.00;
        const double b = 2.00;

        Console.WriteLine(a + b);

        // is it pass by value or pass by reference?
        // variables and types
        /*
         * strings,
         * ints,
         * floats,
         * bool
        */

        // must be careful about data types for what's needed
        // cap 00100 can't be a number

        // declaring vars
        // different ways
        int l = 1;
        // var b = 2;
        const int c = 3;

        // you can initialize without declaring, will default to
        int d; // 0
        string e; // null
        bool z; // false

        double f; // 0.0

        float g; // 0.0f

        // output phase
        //
        // String interpolation
        // var message = $"Hello {l} {c} {d} {e} {z} {f} {g}";
        // Console.WriteLine($"Hello {l} {c} {d} {e} {z} {f} {g}");
        //

        // Type cohersion in c# works only on string concatenation
        const int aa = 1;
        const string bb = "2";
        Console.WriteLine(bb + aa);
        // prints type of bb
        Console.WriteLine(bb.GetType());
        Console.WriteLine("input");
        var userInput = Console.ReadLine();
        Console.WriteLine($"User input is : {userInput}");

        // truthy falsy c#
        //
    }
}
