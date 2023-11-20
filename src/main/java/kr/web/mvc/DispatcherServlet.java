package kr.web.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherServlet extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request,
						HttpServletResponse response)
						throws ServletException, IOException{
		requestPro(request,response);
	}	
	
	@Override
	public void doPost(HttpServletRequest request,
						HttpServletResponse response)
						throws ServletException, IOException{
		requestPro(request,response);
	}
	
	private void requestPro(HttpServletRequest request,
							HttpServletResponse response)
							throws ServletException, IOException{
		Action com = null; //모델 클래스
		String view = null; //jsp 경로
		
		String command = request.getRequestURI(); // ch05-ServletMain/list.do
		System.out.println("1 command : " + command); //첫번째 command
		if(command.indexOf(request.getContextPath())==0) { //맨 앞 contextpath가 있냐 > ch05가 있어서 추출 가능
			command = command.substring(request.getContextPath().length()); // contextpath 다음부터 추출> command에 list.do 담기
			System.out.println("2 command : " + command); // 최종적으로 만들어진 command
		}
		
		if(command == null || command.equals("/list.do")) {
			com = new ListAction();
		}else if(command.equals("/write.do")) {
			com = new WriteAction();
		}else if(command.equals("/detail.do")) {
			com = new DetailAction();
		}else if(command.equals("/update.do")) {
			com = new UpdateAction();
		}else if(command.equals("/delete.do")) {
			com = new DeleteAction();
		}
		
		try {
			//메서드 호출 결과 JSP 경로를 view에 저장
			view = com.execute(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//forward방식으로 view(JSP) 호출
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request,  response);
	}
	
}
