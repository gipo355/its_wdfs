using NUnit.Framework;

namespace Main.Secondary;

[TestFixture]
public class SecondaryTests
{
    [Test]
    public void AddTwo_WithPositiveNumbers_ReturnsCorrectSum()
    {
        // Arrange
        int x = 5;
        int y = 10;
        int expected = 15;

        // Act
        int result = Secondary.AddTwo(x, y);

        // Assert
        Assert.AreEqual(expected, result);
    }

    [Test]
    public void AddTwo_WithNegativeNumbers_ReturnsCorrectSum()
    {
        // Arrange
        int x = -5;
        int y = -10;
        int expected = -15;

        // Act
        int result = Secondary.AddTwo(x, y);

        // Assert
        Assert.AreEqual(expected, result);
    }

    [Test]
    public void AddTwo_WithZero_ReturnsCorrectSum()
    {
        // Arrange
        int x = 0;
        int y = 10;
        int expected = 10;

        // Act
        int result = Secondary.AddTwo(x, y);

        // Assert
        Assert.AreEqual(expected, result);
    }
}
