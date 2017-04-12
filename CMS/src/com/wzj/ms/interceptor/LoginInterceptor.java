package com.wzj.ms.interceptor;

import java.io.PrintStream;
import java.lang.reflect.Method;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.wzj.ms.pojo.User;

public class LoginInterceptor
  implements HandlerInterceptor
{

  public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
  }
  public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView mode) throws Exception {
  }
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    HandlerMethod hm = (HandlerMethod)handler;
    System.out.println("执行的Action方法:" + hm.getMethod().getName());

    if ("login".equals(hm.getMethod().getName())) {
      return true;
    }
    if ("checkLogin".equals(hm.getMethod().getName())) {
      return true;
    }

    String contextPath = request.getContextPath();
    HttpSession session = request.getSession();
    User user = (User)session.getAttribute("loginU");

    if (user == null)
    {
      response.sendRedirect(contextPath + "/login.jsp");
      return false;
    }
    response.sendRedirect(contextPath + "/login.jsp");
    return false;
  }
}