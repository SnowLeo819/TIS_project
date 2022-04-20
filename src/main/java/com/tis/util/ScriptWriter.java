package com.tis.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class ScriptWriter {
	public static void init(HttpServletResponse response) {
		//response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	}
	public static void alert(HttpServletResponse response, String alertMgs) throws IOException {
		init(response);
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('"+alertMgs+"');");
		out.println("</script>");
	}

	public static void alertAndBack(HttpServletResponse response, String alertMgs) throws IOException {
		init(response);
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('"+alertMgs+"');");
		out.println("history.back();");
		out.println("</script>");
	}

	public static void alertAndNext(HttpServletResponse response, String alertMgs, String nextURL) throws IOException {
		init(response);
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('"+alertMgs+"');");
		out.println("location.href='"+nextURL+"';");
		out.println("</script>");
	}
	
	public static void goNext(HttpServletResponse response, String nextURL) throws IOException {
		init(response);
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href='"+nextURL+"';");
		out.println("</script>");
	}
	
	public static void confirm(HttpServletResponse response,String question,String nextURL) throws IOException {
		init(response);
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("let test = confirm('"+question+"');\r\n"
				+ "if (test == true) {\r\n"
				+ "  location.href ='"+nextURL+"';\r\n"
				+ "} else if (test == false) {\r\n"
				+ "  history.back();\r\n"
				+ "}");
		out.println("</script>");
	}
}
