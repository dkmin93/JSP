package com.myweb.users.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myweb.users.model.UsersDAO;
import com.myweb.users.model.UsersDTO;

public class UsersServiceImpl implements UsersService {

	@Override
	public void join(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//값을 받음
		String emailPrev = request.getParameter("email_prev");
		String emailNext = request.getParameter("email_next");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String snsYn = request.getParameter("sns_yn");
		if(snsYn == null) {
			snsYn = "N";
		}
		String email = emailPrev + "@" + emailNext;
		
//		System.out.println(emailPrev);
//		System.out.println(emailNext);
//		System.out.println(name);
//		System.out.println(pw);
//		System.out.println(phone);
//		System.out.println(gender);
//		System.out.println(snsYn);
		
		UsersDAO dao = UsersDAO.getInstance();
		
		int result = dao.idDuplicationCheck(email);
		
		if(result == 1) {
			
			//msg를 화면에 보냄
			request.setAttribute("msg", "이미 존재하는 아이디입니다");
			request.getRequestDispatcher("join.jsp").forward(request, response);
			
		} else {
			UsersDTO dto = new UsersDTO(email, name, pw, phone, gender, snsYn, null);
			dao.join(dto);
			
			//mvc2 방식에서 리다이렉트는 다시 컨트롤러를 태워서 이동할 떄 사용한다
			response.sendRedirect("login.users");
			
		}
		
	}
	
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UsersDAO dao = UsersDAO.getInstance();
		UsersDTO dto = dao.login(id, pw);
		
		if(dto == null) { //아이디, 비밀번호가 틀린 경우
			request.setAttribute("msg", "아이디와 비밀번호를 확인해주세요");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			
			//현재 브라우저의 세션은 request로 얻을 수 있다.
			HttpSession session = request.getSession();
			session.setAttribute("userDTO", dto); //로그인이 되어 있다
			
			response.sendRedirect("../index.jsp");
			
		}
		
	}
	
	@Override
	public void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//update 테이블명 set 업데이트할 값 where pk = ?
		//1.화면에서 넘어온 값을 받는다(이름, 성별, 휴대폰, 수신여부)
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String snsYn = request.getParameter("sns_yn");
		
		//2.email값은 세션에서 얻는다.
		HttpSession session = request.getSession();
		UsersDTO dto = (UsersDTO)session.getAttribute("userDTO"); //getAttribute로 가져온 값은 꼭 캐스팅
		String email = dto.getEmail();
		
		
		UsersDAO dao = UsersDAO.getInstance();
		int result = dao.modify(name, gender, phone, snsYn, email);
		//3.DAO는 modify() 메서드를 생성을 하고 업데이트를 진행한다
		//4.DAO 성공시 1을 반환하고 실패시 0을 반환한다.
		//5.서비스에서는 정보수정
		//성공시에는 메인페이지로 이동, 실패시에는 mypage로 이동
		
		if(result == 0) { //실패
			response.sendRedirect("mypage.users");
			//request.setAttribute("msg", "회원 정보를 확인해주세요");
			//request.getRequestDispatcher("mypage.jsp").forward(request, response);
		} else { //성공
		
			//세션의 정보도 업데이트 복기
			//UsersDTO userDTO = new UsersDTO(email, name, null, phone, gender, null);
			//session.setAttribute("userDTO", userDTO);
			
			//화면에 메세지를 보내는 또다른 방법(out 객체를 사용)
			response.setContentType("text/html; charset=UTF-8;");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('정보가 수정되었습니다');");
			out.print("location.href='/MyWeb/index.jsp';");    //팝업창 기능
			out.print("</script>");
			
			//response.sendRedirect("../index.jsp");
			
		}
		
	}
	
	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.delete from 테이블명 where 키 = ?
		//2.email은 세션에 있다.
		//3.이메일을 세션에서 얻어서 dao에서 삭제를 진행
		//4.삭제 성공시 세션을 삭제하고 메인페이지 이동 (성공메세지도 띄우기) / 실패시 마이페이지 리다이렉트 이동
		
		HttpSession session = request.getSession();
		UsersDTO dto = (UsersDTO)session.getAttribute("userDTO"); //getAttribute로 가져온 값은 꼭 캐스팅
		String email = dto.getEmail();
		
		UsersDAO dao = UsersDAO.getInstance();
		int result = dao.delete(email);
		
		if(result == 0) { //실패
			response.sendRedirect("mypage.users");
			
		} else { //성공
			
			if (session != null) {
			    session.invalidate();
			}
			
			response.setContentType("text/html; charset=UTF-8;");
			PrintWriter out = response.getWriter();
			
			out.print("<script>");
			out.print("alert('정상적으로 탈퇴되었습니다');");
			out.print("location.href='/MyWeb/index.jsp';"); 
			out.print("</script>");
			
		}
		
	}

}
