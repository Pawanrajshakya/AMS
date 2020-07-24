using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.Filters;
using Service_Layer.Interface;
using Microsoft.Extensions.DependencyInjection;
using Service_Layer.Helpers;
using Service_Layer.Dtos;
using System;
using System.Text;
using Microsoft.AspNetCore.Mvc;

namespace API.Helpers
{
    public class CustomActionFilter : IAsyncActionFilter
    {
        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            var userName = context.HttpContext.User.Identity.Name;

            var service = context.HttpContext.RequestServices.GetService<IServiceManager>();
            
            var userDto = await service.User.FindBy(userName);
            
            if (userDto == null || !userDto.IsActive || !userDto.IsVisible)
            {
                context.Result = new BadRequestObjectResult("Invalid User " + userName);
                return;
            }
            
            CurrentUser.User = userDto;

            await SaveUserActivity(context, service, userDto);
            
            await next();
        }

        private static async Task SaveUserActivity(
            ActionExecutingContext context,
            IServiceManager service,
            UserDto userDto)
        {
            UserActivityToSaveDto userActivityToSaveDto = new UserActivityToSaveDto();
            userActivityToSaveDto.ControllerName = context.Controller.ToString();
            userActivityToSaveDto.DateRequested = DateTime.Now;
            userActivityToSaveDto.UserId = userDto.Id;
            userActivityToSaveDto.ActionName = context.ActionDescriptor.DisplayName.ToString();
            var valuesString = new StringBuilder();
            foreach (var value in context.HttpContext.User.Claims)
            {
                valuesString.Append(value.Type
                    + " : "
                    + value.Value
                    + "; ");
            }
            userActivityToSaveDto.Comment = valuesString.ToString();
            await service.UserActivity.Add(userActivityToSaveDto);
        }
    }
}