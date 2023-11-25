namespace Exercise.One;

using System.Globalization;

public static class ExerciseOne {
  public static string GetInput(string message) {
    Console.WriteLine(message);
    var input = Console.ReadLine();

    if (string.IsNullOrEmpty(input)) {
      throw new ArgumentException("Input cannot be null or empty", nameof(message));
    }

    return input;
  }

  public static List<double> GetTempsList(string numberOfTemps) {
    // Convert num temps input passed to method to double
    var numTemps = double.Parse(
        // GetInput("How many temperatures do you want to enter?"),
        numberOfTemps,
        CultureInfo.InvariantCulture
    );

    // var temps = new List<double>();

    // return a list of temps given user input (list of doubles)
    // function must not be callind user input here
    return GetTempsInput(numTemps); // sideEffects, not testable

    // return temps;
  }

  private static List<double> GetTempsInput(double numTemps) {
    var temps = new List<double>();
    for (var i = 0; i < numTemps; i++) {
      var temp = double.Parse(
          GetInput($"Enter temperature {i + 1}"),
          CultureInfo.InvariantCulture
      );
      temps.Add(temp);
    }
    return temps;
  }

  public static void PrintTemps(List<double> customList) {
    foreach (var temp in customList) {
      var tempType = temp switch {
        >= 25 => "hot",
        >= 15 => "warm",
        _ => "cold"
      };
      // var tempType =
      //     temp >= 25
      //         ? "hot"
      //         : temp >= 15
      //             ? "warm"
      //             : "cold";
      Console.WriteLine($"Temperature {temp} is {tempType}");
    }
  }
}
