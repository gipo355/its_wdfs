namespace Main;

using Main.Secondary;

public static class Program {
  public static void Main() {
    Console.WriteLine("Hello, World!");

    Methods.SayHello();

    var added = Methods.AddTwo(3, 4);

    Console.WriteLine($"3 + 4 = {added}");
  }
}
