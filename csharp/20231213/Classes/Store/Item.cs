namespace Store;

internal enum ItemTypes {
  Food,
  Drink,
  Toy,
}

public interface IItem {
  string Name { get; set; }
  double Price { get; set; }

  string Id { get; set; }
}

public class Item : IItem {

  public string Id { get; set; } = Guid.NewGuid().ToString();

  public string Name { get; set; }

  public double Price { get; set; }

  public Item(string name, double price) {
    this.Name = name;
    this.Price = price;
  }
}
