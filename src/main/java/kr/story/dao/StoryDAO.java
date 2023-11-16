package kr.story.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.board.vo.BoardVO;
import kr.story.vo.StoryVO;
import kr.util.DBUtil;

import kr.util.DBUtil;

public class StoryDAO {
	//싱글턴 패턴
	private static StoryDAO instance = new StoryDAO();
	public static StoryDAO getInstance() {
		return instance;
	}
	private StoryDAO() {}
	
	
	
	//글저장
	public void insert(StoryVO storyVO)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			
		}
	}
	
	
	
	//글 총개수
	public int getCount()throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		try {
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
	
	
	
	//글목록
	public List<StoryVO> getList(int startRow, int endRow)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<StoryVO> list = null;
		String sql = null;
		
		try {
			
		}catch(Exception e) {
			throw new Exception(e);
		}
		return list;
	}
	
	
	
	//글상세
	public StoryVO getStory(int num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StoryVO story = null;
		String sql = null;
		
		try {
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return story;
	}
	
	
	
	//글수정
	public void update(StoryVO storyVO)throws Exception{
		
	}
	
	
	//글삭제
	public void delete(int num)throws Exception{
		
	}
}
