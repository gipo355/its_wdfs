namespace Main.SecondaryTests;

using Main.Secondary;
using Xunit;

public class SecondaryTests
{
    [Fact]
    public void AddTwo_WithPositiveNumbers_ReturnsCorrectSum()
    {
        // Arrange
        int x = 5;
        int y = 10;
        int expected = 15;

        // Act
        int result = Methods.AddTwo(x, y);

        // Assert
        Assert.Equal(expected, result);
    }

    [Fact]
    public void AddTwo_WithNegativeNumbers_ReturnsCorrectSum()
    {
        // Arrange
        int x = -5;
        int y = -10;
        int expected = -15;

        // Act
        int result = Methods.AddTwo(x, y);

        // Assert
        Assert.Equal(expected, result);
    }

    [Fact]
    public void AddTwo_WithZero_ReturnsCorrectSum()
    {
        // Arrange
        int x = 0;
        int y = 10;
        int expected = 10;

        // Act
        int result = Methods.AddTwo(x, y);

        // Assert
        Assert.Equal(expected, result);
    }
}
