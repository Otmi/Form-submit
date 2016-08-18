package Servlet;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import timo.User;
public class Demo extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		User user=new User();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String gender=request.getParameter("gender");
		String email=request.getParameter("email");
		String city=request.getParameter("city");
		String introduce=request.getParameter("introduce");
		String[] favorites=request.getParameterValues("favorite");
		try {
			Date birthday=sdf.parse(request.getParameter("birthday"));
			user.setBirthday(birthday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String isAccept=request.getParameter("isAccept");
		if (isAccept.equals("同意")) {
				user.setFlag(true);
		}else{
			    user.setFlag(false);
		}
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setCity(city);
		user.setFavorites(favorites);
		user.setGender(gender);
		user.setIntroduce(introduce);
		//把注册成功的用户对象保存在session中
		request.getSession().setAttribute("upUser", user);
//		request.getSession().setAttribute(name, value);
		//跳转到注册成功页面
		request.getRequestDispatcher("../table.jsp").forward(request,response);
		
	}

}
