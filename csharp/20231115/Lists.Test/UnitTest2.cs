namespace Lists.Test;

public class OneTests
{
    [Fact]
    public void GetInput_ThrowsArgumentException_WhenInputIsNull()
    {
        // Arrange
        var message = "test message";

        // Act & Assert
        var ex = Assert.Throws<ArgumentException>(() => ExerciseOne.GetInput(null));
        Assert.Equal("Input cannot be null or empty (Parameter 'message')", ex.Message);
    }

    [Fact]
    public void GetInput_ThrowsArgumentException_WhenInputIsEmpty()
    {
        // Arrange
        var message = "test message";

        // Act & Assert
        var ex = Assert.Throws<ArgumentException>(() => ExerciseOne.GetInput(""));
        Assert.Equal("Input cannot be null or empty (Parameter 'message')", ex.Message);
    }

    [Fact]
    public void GetTempsList_ReturnsListWithCorrectNumberOfTemps()
    {
        // Arrange
        var numTemps = 3;
        var expectedCount = numTemps;

        // Act
        var result = ExerciseOne.GetTempsList("3");

        // Assert
        Assert.Equal(expectedCount, result.Count);
    }

    [Fact]
    public void GetTempsList_ReturnsListWithCorrectTemps()
    {
        // Arrange
        var expectedTemps = new List<double> { 10.5, 20.0, 30.5 };
        var input = string.Join(Environment.NewLine, expectedTemps);
        Console.SetIn(new System.IO.StringReader(input));

        // Act
        var result = ExerciseOne.GetTempsList("3");

        // Assert
        Assert.Equal(expectedTemps, result);
    }

    [Fact]
    public void PrintTemps_PrintsTempsWithCorrectType()
    {
        // Arrange
        var temps = new List<double> { 10.5, 20.0, 30.5 };
        var expectedOutput =
            "Temperature 10.5 is cold"
            + Environment.NewLine
            + "Temperature 20 is warm"
            + Environment.NewLine
            + "Temperature 30.5 is hot"
            + Environment.NewLine;
        var consoleOutput = new System.IO.StringWriter();
        Console.SetOut(consoleOutput);

        // Act
        ExerciseOne.PrintTemps(temps);
        var result = consoleOutput.ToString();

        // Assert
        Assert.Equal(expectedOutput, result);
    }
}
