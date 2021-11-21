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
import question.model.vo.Question;

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

	public ArrayList<Question> selectQuestion(Connection conn) {
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
}
