using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ACTIVA_IT.WEB.Context;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using PruebaNexos.Servicios;

namespace PruebaNexos
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<AppDbContext>(options => options.UseSqlServer(Configuration.GetConnectionString("NexosEntity"))
            .EnableSensitiveDataLogging(true));

            services.AddSingleton<ILog, Log>();

            services.AddCors();
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
            //    .AddJsonOptions(opt =>
            //{
            //    opt.SerializerSettings.PreserveReferencesHandling = PreserveReferencesHandling.Objects;
            //})
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
                app.UseDeveloperExceptionPage();

            else
                app.UseHsts();

            //Configura el cors
            app.UseCors(options =>
                options.WithOrigins("*")
                .AllowAnyMethod()
                .AllowAnyOrigin()
                .AllowAnyHeader()
                .AllowCredentials()
            );

            //Maneja las excepciones controladas
            app.UseExceptionHandler(a => a.Run(async context =>
            {
                var feature = context.Features.Get<IExceptionHandlerPathFeature>();
                var exception = feature.Error;

                var result = JsonConvert.SerializeObject(new { error = exception.Message });
                context.Response.ContentType = "application/json";
                await context.Response.WriteAsync(result);
            }));

            app.UseHttpsRedirection();
            app.UseMvc();
        }
    }
}
