using System;

namespace Vacay.Models
{
    public class Vacation
    {
        public int id {get; set;}
        public string Name {get; set;}

        public string Attendees {get; set;}
        public int GroupSize {get; set;}
        public DateTime CreatedAt {get;set;}

        public DateTime UpdatedAt {get; set;}

        public DateTime Departing {get; set;}
        public DateTime Returning {get; set;}
        public string CreatorId {get; set;}


        }
    }
