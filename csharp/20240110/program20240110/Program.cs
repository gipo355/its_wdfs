namespace Program;

using Models;
using Config;

public static class Program {
  public static void Main() {

    // TODO: add command line commands for CRUD
    // TODO: move actions to methods

    Console.WriteLine("Init");

    Products.GetAll();
    Products.GetOne(1);



  }

}
