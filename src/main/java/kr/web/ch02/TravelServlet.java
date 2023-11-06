package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/travel")
public class TravelServlet extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest request,
						HttpServletResponse response)
				throws ServletException, IOException{
		
		/*
		 [실습]
		 name, city 전송된 데이터를 받아서 출력하기
		 [출력 예시]
		 이름 : 홍길동
		 여행지 : 서울,파리
		 */
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>여행지 선택</title></head>");
		out.println("<body>");
		
		String name = request.getParameter("name");
		String[] values = request.getParameterValues("city");
		
		out.println("이름 : " + name + "<br>");

		out.println("여행지 : ");
		
		if(values != null) {
			for(int i=0; i<values.length; i++) {
				out.print(values[i]);
				if(i<values.length-1) out.print(", ");
			}
		}else {
			out.println("집~~~~~~~~~~~~~");
		}
		
		
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}
