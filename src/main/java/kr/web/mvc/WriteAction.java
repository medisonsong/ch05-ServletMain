package kr.web.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//request에 데이터 저장
		request.setAttribute("message", "글 등록 완료"); //아직은 db연동이 없기 때문에 db연동해서 하는 것처럼 문구를 여기다 넣은거임
		//JSP 경로 반환
		return "/ch22-mvc/write.jsp";
	}

}
