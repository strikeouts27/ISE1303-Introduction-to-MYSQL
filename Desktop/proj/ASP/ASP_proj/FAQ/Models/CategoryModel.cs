// CategoryModel 
namespace FAQ.Models
{
    public class Category
    {
        // Entities are rows in a C# database. 
        public required int CategoryId { get; set; }
        public required string Name { get; set; }
        public required int FAQID { get; set; }

        public required int TopicID { get; set; }
    }

    // make a category constructor and on model builder
}