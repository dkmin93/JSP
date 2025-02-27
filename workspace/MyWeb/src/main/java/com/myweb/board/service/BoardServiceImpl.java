package com.myweb.board.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.myweb.board.model.BoardDTO;
import com.myweb.board.model.NoticeMapper;
import com.myweb.util.mybatis.MybatisUtil;

public class BoardServiceImpl implements BoardService {

	//sqlSessionFactory
	private  SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();

	@Override
	public void regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String regdate = request.getParameter("regdate");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		//System.out.println(regdate);
		//System.out.println(email);
		//System.out.println(title);
		//System.out.println(content);

		//마이바티스 영역 = DAO를 대신함
		SqlSession sql = sqlSessionFactory.openSession(true);
		NoticeMapper board = sql.getMapper(NoticeMapper.class);
		//실행시키고 싶은 매퍼를 얻어와서 실행시킨다

		//String time = board.getTime();
		//System.out.println("디비에서 얻은정보:" + time);

		BoardDTO dto = new BoardDTO(0, email, title, content, regdate);
		int result = board.regist(dto);
		sql.close();
		//System.out.println("성공실패:" + result);

		//mvc2방식에서 리다이렉트 컨트롤러를 태워나간다
		response.sendRedirect("list.board");

	}

	@Override
	public void getList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		SqlSession sql = sqlSessionFactory.openSession(true);
		NoticeMapper board = sql.getMapper(NoticeMapper.class);

		ArrayList<BoardDTO> list = board.getList();
		sql.close();
		//request객체에 담는다
		request.setAttribute("list", list);

	}

	@Override
	public void getContent(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1. bno 값을 받는다
		//2. mapper에서 bno기준으로 데이터를 조회해서 dto타입으로 반환
		//3. dto를 request에 저장하고 화면으로 이동해서 데이터를 출력

		String bno = request.getParameter("bno");

		//커넥션을 여는 작업 true는 트랜잭션을 하겠다는 의미
		SqlSession sql = sqlSessionFactory.openSession(true);

		//실행시키고 싶은 함수의 타입을 지정 (.class는 속성이 있다. 클래스의 정보타입)
		//sqlSessionFactory에는 다양한 값들이 들어있는데 거기에서 NoticeMapper.class과 매칭되는 값을 달라는 뜻!
		NoticeMapper mapper = sql.getMapper(NoticeMapper.class);

		//mapper객체의 오버라이딩된 추상메서드getContent()를 호출
		BoardDTO dto = mapper.getContent(bno);
		
		sql.close();
		
		request.setAttribute("dto", dto);

	}

	@Override
	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String bno = request.getParameter("bno");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		Map<String, String> map = new HashMap<>();
		map.put("bno", bno);
		map.put("title", title);
		map.put("content", content);

		SqlSession sql = sqlSessionFactory.openSession(true);
		NoticeMapper mapper = sql.getMapper(NoticeMapper.class);
		int result = mapper.update(map);
		sql.close();

		if(result == 1) { //업데이트 성공
			//상세내역으로 이동
			
			response.setContentType("text/html; charset=UTF-8;");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 되었습니다');");
			out.println("location.href='getContent.board?bno="+ bno +"';");
			out.println("</script>");

		} else { //업데이트 실패
			//목록 이동
			response.sendRedirect("list.board");
		}

	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//1.bno 값을 받는다
		String bno = request.getParameter("bno");
		
		//커넥션
		SqlSession sql = sqlSessionFactory.openSession(true);
		NoticeMapper mapper = sql.getMapper(NoticeMapper.class);

		
		mapper.delete(bno);
		sql.close();
		
		response.sendRedirect("list.board");

		//2.삭제는 insert, update 똑같다. delete 태그를 사용하기
		//3.삭제를 진행하고 목록으로 이동해주기

		

	}




}
