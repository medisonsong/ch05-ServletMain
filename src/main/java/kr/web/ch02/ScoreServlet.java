package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/score")
public class ScoreServlet extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest request,
					   HttpServletResponse response)
						throws ServletException, IOException{
		
		//전송된 데이터는 encoding 해야하는데 숫자만 전송된다고 하면 생략 가능 (원칙은 넣는거라 이번은 넣을거임)
		//전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		
		//전송된 데이터 반환 (String -> int)
		int korean = Integer.parseInt(request.getParameter("korean"));
		int english = Integer.parseInt(request.getParameter("english"));
		int math = Integer.parseInt(request.getParameter("math"));
		
		//메서드 별도로 안만들고 그냥 나열해서 총점/ 평균을 구할거임
		//총점
		int sum = korean+english+math;
		//평균
		int average = sum/3;
		//등급
		String grade;
		
		switch(average/10) {
		case 10:
		case 9: grade = "A"; break;
		case 8: grade = "B"; break;
		case 7: grade = "C"; break;
		case 6: grade = "D"; break;
		default: grade = "F";
		}
	
		//화면 출력
		//문서 타입 및 캐릭터셋 지정
		response.setContentType("text/html;charset=utf-8");
		
		//HTML 출력을 위한 출력 스트림을 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>성적 처리</title></head>");
		out.println("<body>");
		out.println("국어 : " + korean + "<br>");
		out.println("영어 : " + english + "<br>");
		out.println("수학 : " + math + "<br>");
		out.println("총점 : " + sum + "<br>");
		out.println("평균 : " + average + "<br>");
		out.println("등급 : " + grade + "<br>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}
