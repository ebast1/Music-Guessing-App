using Microsoft.AspNetCore.Mvc;
using MusicGuessingAppAPI.Models;

namespace MusicGuessingAppAPI.Controllers;

[ApiController]
[Route("api/[controller]")]
public class QuestionsController : ControllerBase
{
    private readonly AppDbContext _context;

    public QuestionsController(AppDbContext context)
    {
        _context = context;
    }

    [HttpGet]
    public ActionResult<IEnumerable<AudioQuestion>> GetQuestions()
    {
        var questions = _context.AudioQuestions.ToList();
        return Ok(questions);
    }
}