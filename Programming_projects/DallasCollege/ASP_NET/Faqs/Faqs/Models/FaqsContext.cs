using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
namespace Faqs.Models
{
    
    public class FaqsContext : DbContext
    {
        // Db Context must have connection settings established in appsettings.json. 
        // also program.cs requires the context to be registered or this migration will not work. 
        // DbContextOptions-> What database am I connecting to and what options am I using? 
        public FaqsContext(DbContextOptions<FaqsContext> options)
            // pass these option benefits to the parent so it can configure itself.
            // All configuration comes via options and OnModelCreating override if present.
            : base(options)
        {

        }

        // Adding a DbSet of one of your models to your DbContext tells EF you need a table with that shape in your database.
        // Db Set accepts the entity class you want to track. the class that maps to a table. 
        // Setting a table in the database 
        // DbSet<TEntity> -> Tables only 

        public DbSet<FAQ> FAQs { get; set; } = null!;
        public DbSet<Category> Categories { get; set; } = null!; 
        public DbSet<Topic> Topics { get; set; } = null!; 

// ...existing code...
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // base.OnModelCreating(modelBuilder);

            // ensure Topic/Category entities are seeded first with matching IDs ("1", etc.)
            // each of these attributes must match what was described in the model or the migration will not work. 

                modelBuilder.Entity<Topic>().HasData(
                new Topic { TopicId = "1", Name = "C#" },
                new Topic { TopicId = "2", Name = "JavaScript" },
                new Topic { TopicId = "3", Name = "Bootstrap" },
                new Topic { TopicId = "4", Name = "ASP.Net" },
                new Topic { TopicId = "5", Name = "Kotlin" },
                new Topic { TopicId = "6", Name = "SQL" },
                new Topic { TopicId = "7", Name = "PL/SQL" },
                new Topic { TopicId = "8", Name = "Java" }
            );

            modelBuilder.Entity<Category>().HasData(
                new Category { CategoryId = "1", Name = "General" },
                new Category { CategoryId = "2", Name = "History" },
                new Category { CategoryId = "3", Name = "Troubleshooting" },
                new Category { CategoryId = "4", Name = "Bugs" },
                new Category { CategoryId = "5", Name = "Domain Modeling" },
                new Category { CategoryId = "6", Name = "Annotations" },
                new Category { CategoryId = "7", Name = "Misc" },
                new Category { CategoryId = "8", Name = "Archive" }
            );

            modelBuilder.Entity<FAQ>().HasData(new FAQ
            {
                Id = "1",
                Question = "What is Bootstrap?",
                Answer = "A CSS framework for creating responsive web apps for multiple screen sizes.",
                TopicId = "1",      // FK value — must match seeded Topic.Id
                CategoryId = "1",   // FK value — must match seeded Category.Id
            });

            modelBuilder.Entity<FAQ>().HasData(new FAQ
            {
                Id = "2",
                Question = "What is C#",
                Answer = "A general purpose object oriented langauge that uses a concise, Java-like syntax.",
                TopicId = "2",
                CategoryId = "2"
            });

            modelBuilder.Entity<FAQ>().HasData(new FAQ
            {
                Id = "3",
                Question = "What is JavaScript",
                Answer = "A general purpose scripting langauge that executes in a web browser?",
                TopicId = "3",
                CategoryId = "3",
            });

            modelBuilder.Entity<FAQ>().HasData(new FAQ
            {
                Id = "4",
                Question = "When was Bootstrap first released?",
                Answer = "In 2011",
                TopicId = "4",
                CategoryId = "4",
            });

            modelBuilder.Entity<FAQ>().HasData(new FAQ
            {
                Id = "5",
                Question = "When was C# first released",
                Answer = "C#",
                TopicId = "5",
                CategoryId = "5",
            });

            modelBuilder.Entity<FAQ>().HasData(new FAQ
            {
                Id = "6",
                Question = "When was Bootstrap first released",
                Answer = "In 2011",
                TopicId = "6",
                CategoryId = "6",
            });

            modelBuilder.Entity<FAQ>().HasData(new FAQ
            {
                Id = "7",
                Question = "When was C# first released?",
                Answer = "In 2002",
                TopicId = "7",
                CategoryId = "7",
            }); 
            
            modelBuilder.Entity<FAQ>().HasData(new FAQ
            {
                Id = "8",
                Question = "When was JavaScript first released?",
                Answer = "In 1995",
                TopicId = "8",
                CategoryId = "8",
            }); 


            
        }
        // ...existing code...

    }
}