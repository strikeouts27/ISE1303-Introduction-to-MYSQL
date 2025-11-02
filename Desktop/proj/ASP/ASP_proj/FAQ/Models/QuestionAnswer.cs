//QuestionAnswer.CS 
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using FAQ.Models; 

namespace FAQ.Models
{
    public class QuestionAnswer
    {
        public required int  Id {get; set;}                            
        public required string  Question {get; set;} 
        public required string Answer { get; set; }

        // an error pops up if i try to make this a required field.
        public required string TopicId { get; set; } = null!;
        public Topic Topic { get; set; } = null!;
        // an error pops up if i try to make this a required field.
        public required string CategoryId { get; set; } = null!;
        public Category Category { get; set; } = null!;        
    }
}