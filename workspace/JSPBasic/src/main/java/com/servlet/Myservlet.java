package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//브라우저로부터 서블릿 클래스로 요청을 맵핑. 기능을 가질 수도 있고 상징적인 의미만 있을 수도 있다.
@WebServlet("/apple")
//어노테이션이라고 부름
public class Myservlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	//생성자
	public Myservlet() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//System.out.println("myServlet 실행됨~!");
		
		//브라우저로의 출력은 out 객체를 사용해야 한다.
		//서버가 브라우저로 응답을 보낼 때 이문서는 어떤 컨텐츠 내용인지를 작성을 해줘야 한다
		//컨텐츠타입(mine 타입)
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out =  resp.getWriter();
		out.println("<b>안녕하세요!?</b>");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
}
