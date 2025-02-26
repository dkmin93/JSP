package com.myweb.board.model;

import java.util.ArrayList;

public interface NoticeMapper {
	//인터페이스 명은 xml이랑 이름을 맞추는게 좋다.
	
	
	//메서드 선언 - 메서드명 xml구현체가 동일한 이름으로 사용함
	String getTime();
	//마이바티스의 매개변수는 기본이 1개(DTO, MAP) 타입을 사용한다
	int regist(BoardDTO dto);
	
	ArrayList<BoardDTO> getList();
	
	BoardDTO getContent(String bno);
	
	
	
	
	
}
