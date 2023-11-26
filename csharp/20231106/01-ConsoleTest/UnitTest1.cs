namespace _01_ConsoleTest;
using Xunit;

public class UnitTest1 {
  [Fact]
  public void Test1() => Assert.Equal(4, InitialConsole.CustomClass.Add(2, 2));
  [Fact]
  public void Test2() => Assert.NotEqual(3, InitialConsole.CustomClass.Add(2, 2));
}
