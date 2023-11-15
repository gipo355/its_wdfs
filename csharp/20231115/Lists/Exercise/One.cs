namespace Exercise.One;

public class ExerciseOne
{
    private static string GetInput(string message)
    {
        Console.WriteLine(message);
        var input = Console.ReadLine();

        if (input == null || input == "")
        {
            throw new Exception("Invalid input");
        }

        return input;
    }

    public static List<double> GetTempsList()
    {
        var numTemps = double.Parse(GetInput("How many temperatures do you want to enter?"));

        var temps = new List<double>();

        for (var i = 0; i < numTemps; i++)
        {
            var temp = double.Parse(GetInput($"Enter temperature {i + 1}"));
            temps.Add(temp);
        }

        return temps;
    }

    public static void PrintTemps(List<double> customList)
    {
        var tempType = "";
        customList.ForEach(
            (temp) =>
            {
                if (temp >= 25)
                {
                    tempType = "hot";
                }

                if (temp is < 25 and >= 15)
                {
                    tempType = "warm";
                }

                if (temp < 15)
                {
                    tempType = "cold";
                }
                Console.WriteLine($"Temperature {temp} is {tempType}");
            }
        );
    }
}
