package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import valueobject.EconomyVo;
//import javax.swing.text.html.HTML;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		int upiid = Integer.parseInt(req.getParameter("upiid"));
		String pass = req.getParameter("pass");
		HttpSession session = req.getSession();
		session.setAttribute("username",upiid );
		String usertype = session.getAttribute("usertype").toString();
		if(usertype.equals("admin"))
		{
			int status = EconomyVo.validate(upiid, pass,usertype);
			if(status == 1)
			{
				res.sendRedirect("adminhomepage.jsp?msg=welcome");
			}
			else {
				res.sendRedirect("adminlogin.jsp?error=Credentials Wrong");
			}
		}
		else {
			int status = EconomyVo.validate(upiid, pass,"user" );
			if(status == 1)
			{
				res.sendRedirect("options.jsp?msg=welcome");
			}
			else {
				out.println("Unable to Login");
				res.sendRedirect("index.jsp?error=Credentials Wrong");
			}
		}
		
//		if(!uname.equals(""))
//		{
//			if(pass.equals("admin123"))
//			{
//				res.sendRedirect("options.jsp");
//			}
//			else {
//				out.println("Unable to Login");
//				req.getRequestDispatcher("index.jsp").include(req, res);
//			}
//		}
//		else 
//		{
//			
//				out.println("Unable to Login");
//				req.getRequestDispatcher("index.jsp").include(req, res);
//			
//		}
		
	}
   

}
