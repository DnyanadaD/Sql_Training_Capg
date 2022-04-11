using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace Sample_code_first.Models
{
    public class TodoContext : DbContext
    {
        public TodoContext(DbContextOptions<TodoContext> options) : base(options)
        {

        }
        public DbSet<TodoItem> TodoItem { get; set; }
        protected override void OnModelCreating(ModelBuilder modelbuilder)
        {
            modelbuilder.Entity<TodoItem>().HasData(
                new TodoItem() { Id = 1, Name = "Meet with management", IsComplete = true, Description = "In meeting need to discuss some points" },
                new TodoItem() { Id = 2, Name = "Go for Shopping", IsComplete = false, Description = "List of this this item buy" }
                );
        }

    
    }
}
