using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MusicGuessingAppAPI.Models
{
    public class AudioQuestion
    {
        [Key]
        public int Id { get; set; }

        public string ShowName { get; set; } = "";
        public string SongType { get; set; } = "";
        public string SongName { get; set; } = "";
        public bool IsMultipleChoice { get; set; }
        public string[] Choices { get; set; } = new string[0];
        public string Genre { get; set; } = "";
        public string Difficulty { get; set; } = "";
    }
}