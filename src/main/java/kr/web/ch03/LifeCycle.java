package kr.web.ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lifeCycle")
public class LifeCycle extends HttpServlet{
	//어떻게 사용, 호출되는지 동작방식을 확인하기 위해 변수 생성
	int initCnt = 0;
	int serviceCnt = 0;
	int destroyCnt = 0;
	
	@Override
	public void init()throws ServletException{
		System.out.println("init 메서드는 첫 요청만 호출됨 : " +
	(++initCnt));
	}
	
	@Override
	public void service(HttpServletRequest request,
						HttpServletResponse response)
			throws ServletException,IOException {
		System.out.println("service 메소드가 요청할 때마다 호출됨 : " +
			(++serviceCnt));
		
		//문서 타입 및 캐릭터셋 지정
		response.setContentType("text/html;charset=utf-8"); //화면 만들기
		
		//HTML출력을 위한 출력 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>Servlet Life Cycle</title></head>");
		out.println("<body>");
		out.println("서블릿 init()의 호출 횟수 : " + initCnt + "<br>");
		out.println("서블릿 service()의 호출 횟수 : " + serviceCnt + "<br>");
		out.println("</body>");
		out.println("</html>");
		out.close();		
	}

	@Override
	public void destroy() {
		System.out.println("destroy 메서드는 본 Servlet이 더이상 사용되지 않을 때만 호출됨 : " +
		(++destroyCnt));
	}
}

/*
 * 생성자 호출 이후 init 딱 한번 호출
 * 만들어진 객체를 사용 안할때 가비지 컬렉터가 삭제하기 직전에 destroy 동작/출력 (언제 소멸될지 몰라서 강제소멸 시킨 후 확인해볼거임)
 * 
 * destroy() 소멸시키는 방법
 * 46line에 공백 겁나 쳐서 저장 -> destroy 메서드는 본 Servlet이 더이상 사용되지 않을 때만 호출됨 : 1 라고 콘솔에 표시됨
 * reload로 인식하기 때문!
 * 
 * [출력결과]
 * 서블릿 init()의 호출 횟수 : 1
 * 서블릿 service()의 호출 횟수 : 1 // 새로고침 누를때마다 얘만 숫자가 ++ 커짐
 * 
 * [console]
 * destroy 메서드는 본 Servlet이 더이상 사용되지 않을 때만 호출됨 : 1
 */