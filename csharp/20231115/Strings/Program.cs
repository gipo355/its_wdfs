string email;
email = "tony@gmail.com";

// methods for sttings
Console.WriteLine(email.Length);

// email.Aggregate
// email.Contains("@");
// email.Append("gmail.com");
// email.Clone();
// email.ToUpper();
// mail.ToLower();
// email.StartsWith("t");
// email.EndsWith("m");
// email.IndexOf("n"); -1 if not found
// email.LastIndexOf("n");
// email.Insert(4, "aaa");
// email.Remove(4, 2);
// email.PadLeft(20);
// email.PadRight(20);
// email.Replace('t', 'T');
// email.Split('@');
// email.Substring(0, 3);
// email.ToCharArray();
// email.Trim();
// email.TrimEnd();
// email.TrimStart();
// email.ToList();
// email.Concat("gmail.com");
// email.ElementAt(0);
// email.ElementAt(-1);

var surname = "Stark";

var methods = new Strings.Methods();

try {
    var cf = methods.GetCF(surname);
    Console.WriteLine(cf);
} catch (Exception e) {
    Console.WriteLine(e);
}

namespace Strings {
    public class Methods {
        private readonly List<char> vowels = new() { 'a', 'e', 'i', 'o', 'u' };

        public string GetCF(string surname) {
            var surArr = surname.ToLower().ToArray();
            var cf = string.Join(
                    "",
                    Array.FindAll(
                        surArr,
                        // c => c is not 'a' and not 'e' and not 'i' and not 'o' and not 'u'
                        c => !this.vowels.Contains(c)
                    )[..3]
                )
                .ToUpper();

            return cf;
        }
    }
}
