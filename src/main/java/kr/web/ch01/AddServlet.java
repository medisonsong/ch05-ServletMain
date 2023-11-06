package kr.web.ch01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/add")
public class AddServlet extends HttpServlet{
	@Override //재정의 확인
	public void doGet(HttpServletRequest request,
					  HttpServletResponse response)
							throws ServletException, IOException{
		//전송된 데이터 반환
									//String->int
		int num1 = Integer.parseInt(request.getParameter("num1")); //전송된 데이터 반환받기
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		//문서 타입 및 캐릭터셋 지정
		response.setContentType("text/html;charset=utf-8");
		
		//HTML 출력을 위한 출력 스트림을 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>덧셈하기</title></head>");
		out.println("<body>");
		out.printf("%d + %d = %d",num1,num2,num1+num2);
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}
