using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for adminmodule
/// </summary>
public class adminmodule
{
	public adminmodule()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    
    public List<string> UrlRoutes()
    {
        List<string> list = new List<string>();
        //Module SEO
        list.Add("moduleseo|admin-seo|~/admin_page/module_function/module_SEO.aspx");
        //Module Language
        list.Add("modulelanguage|admin-ngon-ngu|~/admin_page/module_function/admin_LanguagePage.aspx");
        //list.Add("moduleaccount|admin-accounths|~/admin_page/module_function/module_Account.aspx");
        //Quản lý sản phẩm
       
        return list;
    }
}