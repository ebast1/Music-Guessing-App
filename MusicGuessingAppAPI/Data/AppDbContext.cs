using Microsoft.EntityFrameworkCore;
using MusicGuessingAppAPI.Models;

namespace MusicGuessingAppAPI
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) {}

        public DbSet<AudioQuestion> AudioQuestions => Set<AudioQuestion>();
    }
}