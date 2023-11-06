package kr.web.ch01;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
//import java.sql.Date; slq.date 이건 데이터베이스 연동할때만 사용 (자동완성이 잘못될수도 있음)
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//주소 지정
@WebServlet("/now") 
public class NowServlet extends HttpServlet{ //now 서블릿 생성 (main이 없어도 되는 클래스임)
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		Date now = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy년MM월dd일 a hh:mm:ss"); //a 오전오후 나타냄
		
		//문서 타입 및 캐릭터셋 지정
		response.setContentType("text/html;charset=utf-8");
		
		//HTML 출력을 위한 출력 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>현재 날짜와 시간</title></head>");
		out.println("<body>");
		out.println("현재 날짜와 시간 : " + sf.format(now)); //데이터 호출
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}

