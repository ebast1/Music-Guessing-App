namespace MusicGuessingAppAPI;

public class AudioQuestion
{
    public int Id { get; set; }
    public string ShowName { get; set; }
    public string[] Choices { get; set; }
    public string AudioURL { get; set; }
    public string Genre { get; set; }
    public string Difficulty { get; set; }
}