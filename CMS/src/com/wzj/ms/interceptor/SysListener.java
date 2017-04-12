package com.wzj.ms.interceptor;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class SysListener
  implements ServletContextListener
{
  public void contextDestroyed(ServletContextEvent arg0)
  {
  }

  public void contextInitialized(ServletContextEvent sce)
  {
    String version = "1.";
    version = version + Math.round(Math.random() * 100.0D);
    sce.getServletContext().setAttribute("version", version);
    sce.getServletContext().log("Update Version：V" + version);
  }

  public static void main(String[] args)
  {
  }
}