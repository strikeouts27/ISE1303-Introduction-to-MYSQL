// TopicModel.cs 
namespace FAQ.Models

{
    public class Topic
    {
        // must be a string per instructions
        public required string Id { get; set; }
        public required string Name { get; set; }
    }

    // make a topic constructor and on model builder
    // public FAQModel() { } // EF-friendly parameterless ctor

    //  protected void OnModelCreating(ModelBuilder modelBuilder)
}