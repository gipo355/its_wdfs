namespace Store;

using System.Linq;
using Microsoft.EntityFrameworkCore;
using Model;

public enum RemoveItemKey {
  Name,
  Id,
}

public interface IRemoveOptions {

  RemoveItemKey Key { get; }

  string Value { get; }
}

public static partial class InventoryManager {
  // TODO: move to sqlite

  // the get calls the db
  public static List<Item> Inventory { get; } = [];

  public static DbContext Db { get; } = new ItemsContext();

  // move methods to db calls
  public static void AddItem(Item item) {
    Db.Add(item);
    Db.SaveChanges();
  }

  public static void RemoveItem(Item item) {
    Db.Remove(item);
    Db.SaveChanges();
  }

  public static bool RemoveItem(RemoveItemKey key, string value) {
    try {
      Item? itemToRemove = null;
      if (key.ToString() == "Id") {
        itemToRemove = Inventory.Find(item => item?.Id == value);
      }
      if (key.ToString() == "Name") {
        itemToRemove = Inventory.Find(item => item?.Name == value);
      }

      if (itemToRemove == null) {
        return false;
      }
      // Inventory.Remove(itemToRemove);
      Db.Remove(itemToRemove);
      return true;
    } catch {
      return false;
    }
  }

  public static double CalcTotal() => Inventory.Sum(item => item.Price);

}

