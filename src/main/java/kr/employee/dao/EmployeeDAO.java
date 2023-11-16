package kr.employee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.employee.vo.EmployeeVO;
import kr.util.DBUtil;

public class EmployeeDAO {
	//싱글턴 패턴
	private static EmployeeDAO instance = new EmployeeDAO();
	
	public static EmployeeDAO getInstance() {
		return instance;
	}
	private EmployeeDAO() {}
	
	
	
	//사원 등록
	public void insertEmployee(EmployeeVO vo)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			sql = "INSERT INTO semployee (snum,id,name,passwd,salary,job) VALUES (semployee_seq.nextval,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPasswd());
			pstmt.setInt(4, vo.getSalary());
			pstmt.setString(5, vo.getJob());
			
			pstmt.executeQuery();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	
	//사원 상세 정보
	public EmployeeVO getEmployee(int snum)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		EmployeeVO vo = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM semployee WHERE snum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, snum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new EmployeeVO();
				vo.setSnum(rs.getInt("snum"));
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setJob(rs.getString("job"));
				vo.setSalary(rs.getInt("salary"));
				vo.setReg_date(rs.getDate("reg_date"));
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return vo;
	}
	
	
	//아이디 중복 체크, 로그인 체크
	public EmployeeVO checkEmployee(String id)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmployeeVO vo = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM semployee WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new EmployeeVO();
				vo.setId(rs.getString("id"));
				vo.setSnum(rs.getInt("snum"));
				vo.setPasswd(rs.getString("passwd"));
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return vo;
	}
	
	
	//사원정보 수정
	public void updateEmployee(EmployeeVO vo)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "UPDATE semployee SET name=?,passwd=?,salary=?,job=? WHERE snum=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setInt(3, vo.getSalary());
			pstmt.setString(4, vo.getJob());
			pstmt.setInt(5, vo.getSnum());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	
	//사원정보 삭제
	public void deleteEmployee(int snum)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "DELETE FROM semployee WHERE snum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, snum);
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
}
