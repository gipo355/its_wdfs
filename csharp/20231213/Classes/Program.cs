using Global;
using Store;

Console.WriteLine(Config.CoreNumber);

// Console.WriteLine(args[0]);


// myListArticoli has 3 articles
// calc the value in the cart with iva included and excluded

var item1 = new Item("item1", 10);
var item2 = new Item("item2", 20);

InventoryManager.AddItem(item1);
InventoryManager.AddItem(item2);

InventoryManager.Inventory.ForEach(item => Console.WriteLine(item.Name));
