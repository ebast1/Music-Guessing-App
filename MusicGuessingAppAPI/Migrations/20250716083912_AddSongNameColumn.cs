using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MusicGuessingAppAPI.Migrations
{
    /// <inheritdoc />
    public partial class AddSongNameColumn : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "SongName",
                table: "AudioQuestions",
                type: "text",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "SongName",
                table: "AudioQuestions");
        }
    }
}
