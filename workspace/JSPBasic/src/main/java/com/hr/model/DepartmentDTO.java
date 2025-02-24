package com.hr.model;

public class DepartmentDTO {

	//DTO클래스는 데이터베이스에 전달될, 전달할 데이터를 운반하는 클래스
	//멤버변수를 테이블의 컬럼과 동일하게 생성해야한다.
	
	//1. 은닉 클래스로 생성한다.
	//2. 생성자는 기본 생성자와 모든 멤버변수를 전달받는 생성자
	
	private int departmentId;
	private String departmentName;
	private int managerId;
	private int locationID;
	
	
	public DepartmentDTO() {
		
	}

	//알트+쉬프트+s 로 생성자 게터 세터 생성
	public DepartmentDTO(int departmentId, String departmentName, int managerId, int locationID) {
		super();
		this.departmentId = departmentId;
		this.departmentName = departmentName;
		this.managerId = managerId;
		this.locationID = locationID;
	}

	public int getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public int getManagerId() {
		return managerId;
	}

	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}

	public int getLocationID() {
		return locationID;
	}

	public void setLocationID(int locationID) {
		this.locationID = locationID;
	}
	
	
	
	
	
	
}
