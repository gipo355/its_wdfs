namespace Program;

using Models;

public static class Program {
  public static async Task Main() {

    // TODO: add command line commands for CRUD

    Console.WriteLine("Init");

    await Products.GetAll();
    Products.UpdateOne(id: 1, name: "changed", description: "changed", price: 1.99, quantity: 1, taxRate: 0.22);
    Products.GetOne(id: 1);
    Products.DeleteOne(id: 2);

  }

}
