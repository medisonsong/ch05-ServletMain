package kr.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.member.vo.MemberVO;
import kr.util.DBUtil;

public class MemberDAO {
	/*
	 * 싱글턴 패턴은 생성자를 private으로 지정해서 외부에서 호출할 수 없도록
	 * 처리하고 static 메서드를 호출해서 객체가 한 번만 생성되고 생성된 객체를
	 * 공유할 수 있도록 처리하는 방식을 의미 
	 */
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private MemberDAO() {}
	
	//회원가입
	public void insertMember(MemberVO member)throws Exception{ 
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션 풀로부터 커넥션 할당받아서 1~2단계는 신경안써도 됨
			//커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection(); //1~2단계 끝
			
			//SQL문 작성
			sql = "INSERT INTO smember (num,id,name,passwd,email,phone) VALUES (smember_seq.nextval,?,?,?,?,?)"; //reg_date는 default값이 있어서 명시 x
			
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			//?에 데이터 바인딩
			pstmt.setString(1, member.getId()); //member에 넣었기 때문에 접근해서 빼내야함
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPasswd());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPhone());
			
			//4단계 : sql문장 실행
			pstmt.executeUpdate();
			
		}catch(Exception e) { 
			throw new Exception(e); //원래 발생한 예외 문구 던지기
		}finally {
			DBUtil.executeClose(null, pstmt, conn); 
		}
	}
	/*
	 * 메서드를 통해 동작시킬 때 예외 발생 시 콘솔에는 에러가 뜨는데 화면엔 안뜸(정상작동된 것처럼 보이게 함)
	 * 그래서 에러 페이지가 전송되게 만들어야 하는데 그럼 catch가 없어야함
	 * catch가 없을 시 예외가 발생하게 되면 catch쪽으로 갈 수 없으니까 에러 페이지가 전송됨
	 * 
	 * catch를 아예 안쓰거나 catch를 던지면 됨
	 */
	
	
	//회원상세정보
	public MemberVO getMember(int num)throws Exception{ //num(pk)로 정보를 읽고 MemberVO에 담는 것
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemberVO member = null;
		
		try {
			//커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "SELECT * FROM smember WHERE num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setInt(1, num);
			//SQL문 실행
			rs = pstmt.executeQuery();
			//pk로 1개의 레코드만 빼내기 때문에 if문 (여러개면 while)
			if(rs.next()) {
				member = new MemberVO(); //자바빈 객체 생성
				//아래로 다 명시하고 필요할 때 출력하던가 아님 원하는 것만 넣고 다 출력하던가 상관없는데 그냥 다 명시하고 뽑아내는게 편하다했음
				member.setNum(rs.getInt("num"));
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone"));
				member.setReg_date(rs.getDate("reg_date"));
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return member;
	}
	
	//아이디 중복 체크, 로그인 체크 (같이)
	public MemberVO checkMember(String id)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemberVO member = null; //여기다 넣고 반환할거라서
		
		try {
			//커넥션 풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "SELECT * FROM smember WHERE id=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setString(1, id);
			//SQL문 실행
			rs = pstmt.executeQuery();
			if(rs.next()) { //행이 있으면 데이터를 넘겨줌 (id 중복 시)
				member = new MemberVO(); //자바빈(VO) 객체 생성
				member.setId(rs.getString("id"));
				member.setNum(rs.getInt("num"));
				member.setPasswd(rs.getString("passwd"));
			}//else는 없음 (MemberVO member = null가 있기 때문에 행이 없으면 null을 반환)
		}catch(Exception e) {
			throw new Exception(e); //예외를 던져야 예외발생 시 에러페이지가 보임
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return member;
	}
	
	
	//회원정보수정
	public void updateMember(MemberVO member)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "UPDATE smember SET name=?,passwd=?,email=?,phone=? WHERE num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			//?에 데이터 바인딩
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getPhone());
			pstmt.setInt(5, member.getNum());
			
			//SQL문 실행
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally{
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//회원탈퇴(회원정보삭제)
	public void deleteMember(int num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "DELETE FROM smember WHERE num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setInt(1, num);
			//SQL문 실행
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
}
