﻿using Microsoft.EntityFrameworkCore.Migrations;

namespace Sample_code_first.Migrations
{
    public partial class addedDescription : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Description",
                table: "TodoItem",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Description",
                table: "TodoItem");
        }
    }
}
