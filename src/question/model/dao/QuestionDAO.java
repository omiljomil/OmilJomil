package question.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import User.model.dao.UserDAO;
import page.PageInfo;
import question.model.vo.Question;
import review.model.vo.Photo;

public class QuestionDAO {
private Properties prop = null;
	
	public QuestionDAO() {
		prop = new Properties();
		String fileName = QuestionDAO.class.getResource("/sql/Question/Question-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Question> selectQuestion(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Question> list = null;
		String query = prop.getProperty("selectQuestion");
		
		int startRow = (pi.getCurrentPage() - 1 ) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Question>();
			
			while(rset.next()) {
				Question q = new Question(rset.getInt(2),
											rset.getString(3),
											rset.getString(4),
											rset.getString(5),
											rset.getDate(6),
											rset.getDate(7),
											rset.getString(8));
				list.add(q);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public int insertQuestion(Connection conn, Question q) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertQuestion");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, q.getQst_title());
			pstmt.setString(2, q.getQst_cont());
			pstmt.setString(3, q.getUser_id());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
/*
	public int insertQuestionImg(Connection conn, ArrayList<Photo> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertQuestionImg");
		
		try {
			pstmt = conn.prepareStatement(query);
			for (int i = 0; i < fileList.size(); i++) {
				pstmt.setString(1, fileList.get(i).getImgName());
				pstmt.setString(2, fileList.get(i).getImgChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				pstmt.setInt(4, fileList.get(i).getFileLevel());
				result +=pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
*/
	public int qsCount(Connection conn) {
		Statement stmt=null;
		ResultSet rset=null;
		int result =0;
		
		String query = prop.getProperty("qsCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
			
		}
		
		return result ;
	}

	public ArrayList selectQList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Question> list = null;
		String query = prop.getProperty("selectQuestion");
		try {
			stmt = conn.prepareStatement(query);
			rset=stmt.executeQuery(query);
			list = new ArrayList<Question>();
			while(rset.next()) {
				Question q = new Question(rset.getInt("qst_no"),
											rset.getString("qst_title"),
											rset.getString("qst_cont"),
											rset.getString("user_id"),
											rset.getDate("enroll_date"),
											rset.getDate("modify_date"),
											rset.getString("status"));
				list.add(q);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}

	public ArrayList selectFList(Connection conn) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Question> list = null;
		String query = prop.getProperty("selectFList");
		try {
			stmt = conn.prepareStatement(query);
			rset=stmt.executeQuery(query);
			list = new ArrayList<Question>();
			while(rset.next()) {
				Question q = new Question(rset.getInt("qst_no"),
											rset.getString("qst_title"),
											rset.getString("qst_cont"),
											rset.getString("user_id"),
											rset.getDate("enroll_date"),
											rset.getDate("modify_date"),
											rset.getString("status"));
				list.add(q);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}

	public Question selectQuestionDetail(Connection conn, String write) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Question q = null;
		String query = prop.getProperty("selectQuestionDetail");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, write);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				q = new Question(rset.getInt("qst_no"),
						rset.getString("qst_title"),
						rset.getString("qst_cont"),
						rset.getString("user_id"),
						rset.getDate("enroll_date"),
						rset.getDate("modify_date"),
						rset.getString("status"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return q;
	}

	public int deleteQuestion(Connection conn, String write) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteQuestion");
		try {
			pstmt =conn.prepareStatement(query);
			pstmt.setString(1, write);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	
}
