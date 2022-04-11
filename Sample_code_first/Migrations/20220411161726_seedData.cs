using Microsoft.EntityFrameworkCore.Migrations;

namespace Sample_code_first.Migrations
{
    public partial class seedData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "TodoItem",
                columns: new[] { "Id", "Description", "IsComplete", "Name" },
                values: new object[] { 1L, "In meeting need to discuss some points", true, "Meet with management" });

            migrationBuilder.InsertData(
                table: "TodoItem",
                columns: new[] { "Id", "Description", "IsComplete", "Name" },
                values: new object[] { 2L, "List of this this item buy", false, "Go for Shopping" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "TodoItem",
                keyColumn: "Id",
                keyValue: 1L);

            migrationBuilder.DeleteData(
                table: "TodoItem",
                keyColumn: "Id",
                keyValue: 2L);
        }
    }
}
