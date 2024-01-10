namespace Program;

using Models.Product;

public static class Program {
  public static async Task Main() {

    // TODO: add command line commands for CRUD

    Console.WriteLine("Initializing app");

    await LauchCLI();


    // await Products.GetAll();
    // await Products.GetOne(id: 1);
    // await Products.DeleteOne(id: 2);
    // await Products.CreateOne(name: "new", description: "new", price: 1.99, quantity: 1, taxRate: 0.22);
    // await Products.UpdateOne(id: 1, name: "changed", description: "changed", price: 1.99, quantity: 1, taxRate: 0.22);
  }

  private static void ListCommands() {
    Console.WriteLine(" Commands:");
    Console.WriteLine("        |-  h: show this help");
    Console.WriteLine("        |-  1: create a new product");
    Console.WriteLine("        |-  2: read all products");
    Console.WriteLine("        |-  3: update a product");
    Console.WriteLine("        |-  4: delete a product");
    Console.WriteLine("        |-  q: quit the app");
  }

  private static async Task LauchCLI() {

    Console.WriteLine("Enter a command (h for help):");
    ListCommands();
    var command = Console.ReadLine();

    switch (command) {
      case "h":
        ListCommands();
        break;
      case "1":
        await Products.CreateOne(name: "new", description: "new", price: 1.99, quantity: 1, taxRate: 0.22);
        break;
      case "2":
        await Products.GetAll();
        break;
      case "3":
        await Products.UpdateOne(id: 1, name: "changed", description: "changed", price: 1.99, quantity: 1, taxRate: 0.22);
        break;
      case "4":
        await Products.DeleteOne(id: 2);
        break;
      case "q":
        Environment.Exit(1);
        break;
      default:
        Console.WriteLine("Command not found");
        break;
    }

    await LauchCLI();
  }
}
