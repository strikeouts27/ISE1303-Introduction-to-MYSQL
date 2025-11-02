// FAQContext.cs 
using Microsoft.EntityFrameworkCore;
using FAQ.Models;

namespace FAQ.Data.FAQContext
{
    public class FAQContext : DbContext
    {
        public FAQContext(DbContextOptions<FAQContext> options)
            // pass these option benefits to the parent so it can configure itself.
            // All configuration comes via options and OnModelCreating override if present.
            : base(options)
        {

        }

        // Adding a DbSet of one of your models to your DbContext tells EF you need a table with that shape in your database.
        // Db Set accepts the entity class you want to track. the class that maps to a table. 
        public DbSet<QuestionAnswer> FAQs { get; set; } = null!;
        public DbSet<Category> Categories { get; set; } = null!; 
        public DbSet<Topic> Topics { get; set; } = null!; 

// ...existing code...
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // ensure Topic/Category entities are seeded first with matching IDs ("1", etc.)
            modelBuilder.Entity<QuestionAnswer>().HasData(new QuestionAnswer
            {
                Id = 1,
                Question = "What is Bootstrap?",
                Answer = "A CSS framework for creating responsive web apps for multiple screen sizes.",
                TopicId = "1",      // FK value — must match seeded Topic.Id
                CategoryId = "1",   // FK value — must match seeded Category.Id
            });

            modelBuilder.Entity<QuestionAnswer>().HasData(new QuestionAnswer
            {
                Id = 2,
                Question = "What is C#",
                Answer = "A general purpose object oriented langauge that uses a concise, Java-like syntax.",
                TopicId = "1",
                CategoryId = "1"
            }); 
        }
        // ...existing code...

    }
}