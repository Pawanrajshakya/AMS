namespace Service_Layer.Dtos.Menu
{
    public class UserMenuDto
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Link { get; set; }
        public string IconName { get; set; }
        public int MainMenuId { get; set; }
        public int SortId { get; set; }
        public System.Collections.Generic.List<UserMenuDto> SubMenu { get; set; }
    }
}