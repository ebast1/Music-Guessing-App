using Microsoft.AspNetCore.Mvc;

namespace MusicGuessingAppAPI.Properties;

[ApiController]
[Route("api/[controller]")]
public class QuestionsController : ControllerBase
{
    [HttpGet]
    public ActionResult<IEnumerable<AudioQuestion>> GetQuestions()
    {
        var questions = new List<AudioQuestion>
        {
            new AudioQuestion
            {
                ShowName = "Black Clover",
                Choices = new[] { "Black Clover", "Naruto", "One Piece", "Bleach" },
                AudioURL = "https://example.com/audio/blackclover.mp3",
                Genre = "Action",
                Difficulty = "Easy"
            },
            
            new AudioQuestion
            {
                ShowName = "Frieren: Beyond Journey's End",
                Choices = new[] { "Frieren: Beyond Journey's End", "Dandadan", "Vinland Saga", "Solo Leveling" },
                AudioURL = "https://example.com/audio/frierenbeyondjourneysend.mp3",
                Genre = "Adventure",
                Difficulty = "Medium"
            },
            
            new AudioQuestion
            {
                ShowName = "Your Lie in April",
                Choices = new[] { "Your Lie in April", "My Teen Romantic Comedy Snafu", "Call of the Night", "My Dress Up Darling" },
                AudioURL = "https://example.com/audio/yourlieinapril.mp3",
                Genre = "Romance",
                Difficulty = "Hard"
            }
            
        };
        return Ok(questions);
    }
}