package User.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import User.model.vo.User;

public class UserDAO {
	private Properties prop = null;
	
	public UserDAO() {
		prop = new Properties();
		String fileName = UserDAO.class.getResource("/sql/User/User-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int checkId(Connection conn, String inputId) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("checkId");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, inputId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public User login(Connection conn, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		User m = null;
		
		String query = prop.getProperty("login");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,  userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new User(rset.getString("USER_ID"),
										rset.getString("USER_PWD"),
										rset.getString("USER_NAME"),
										rset.getString("PHONE"),
										rset.getString("EMAIL"),
										rset.getString("MANAGER"),
										rset.getDate("ENROLL_DATE"),
										rset.getDate("MODIFY_DATE"),
										rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
		
	}

	public String idFindResult(Connection conn, String userName, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String id = null;
		
		String query = prop.getProperty("idFindResult");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userName);
			pstmt.setString(2, email);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				id = rset.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return id;
	}

	public User UserIdsearch(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		User m = null;
		
		String query = prop.getProperty("userIdsearch");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new User(rset.getString("USER_ID"),
									rset.getString("USER_PWD"),
									rset.getString("USER_NAME"),
									rset.getString("PHONE"),
									rset.getString("EMAIL"),
									rset.getString("MANAGER"),
									rset.getDate("ENROLL_DATE"),
									rset.getDate("MODIFY_DATE"),
									rset.getString("STATUS"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

	public int insertUser(Connection conn, User user) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertUser");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getUserPwd());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPhone());
			pstmt.setString(6, user.getManager());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<User> userList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<User> list = null;
		
		String query = prop.getProperty("userList");
		
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<User>();
			
			while(rset.next()) {
				String userId = rset.getString("user_id");
				String userPwd = rset.getString("user_pwd");
				String userName = rset.getString("user_name");
				String phone = rset.getString("phone");
				String email = rset.getString("email");
				String manager = rset.getString("manager");
				Date enrollDate = rset.getDate("enroll_date");
				Date modifyDate = rset.getDate("modify_date");
				String status = rset.getString("status");
				
				User m = new User(userId, userPwd, userName, phone, email, manager, enrollDate, modifyDate, status);
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = conn.createStatement();
		    rset = stmt.executeQuery(query);
		    
		    if(rset.next()) {
		    	listCount = rset.getInt(1);
		    }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}
	
	public ArrayList<User> userSearch(Connection conn, String cond, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<User> list = null;
		
		String selectQuery = "";
		
		switch(cond) {
		case "id":
			selectQuery = "userSearch1";
			break;
		case "name":
			selectQuery = "userSearch2";
			break;
		case "email":
			selectQuery = "userSearch3";
			break;
		case "phone":
			selectQuery = "userSearch4";
			break;
		case "enroll":
			selectQuery = "userSearch5";
			break;
		case "manager":
			selectQuery = "userSearch6";
			break;
		case "status":
			selectQuery = "userSearch7";
			break;
		}
		
		String query = prop.getProperty(selectQuery);
		
		try {
			pstmt = conn.prepareStatement(query);
			

			
			if(cond.equals("status") && search.equals("가입")) {
				search = "Y";
			} else if(cond.equals("status") && search.equals("탈퇴")) {
				search = "N";
			} else if(cond.equals("manager") && search.equals("관리자")) {
				search = "Y";
			} else if(cond.equals("manager") && search.equals("일반회원")) {
				search = "N";
			}
			
			pstmt.setString(1, "%" + search + "%");
			rset = pstmt.executeQuery();
			
			list = new ArrayList<User>();
			
			while(rset.next()) {
				String userId = rset.getString("user_id");
				String userPwd = rset.getString("user_pwd");
				String userName = rset.getString("user_name");
				String phone = rset.getString("phone");
				String email = rset.getString("email");
				String manager = rset.getString("manager");
				Date enrollDate = rset.getDate("enroll_date");
				Date modifyDate = rset.getDate("modify_date");
				String status = rset.getString("status");
				
				User m = new User(userId, userPwd, userName, phone, email, manager, enrollDate, modifyDate, status);
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int selectDelete(Connection conn, String[] users) {
		PreparedStatement pstmt = null;
		int result = 0;
		String paras = "";
		
		for(int i = 0; i < users.length; i++) {
			if(i == 0) {
				paras += "?";
			} else {
				paras += ", ?";
			}
		}
		
		String query = "UPDATE \"USER\" SET STATUS = 'N', MODIFY_DATE = SYSDATE WHERE USER_ID IN (" + paras + ")";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			for(int i = 0; i < users.length; i++) {			
				pstmt.setString(i + 1, users[i]);
			}
		
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int checkPwd(Connection conn, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("checkPwd");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateUser(Connection conn, User m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateUser");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public User selectUser(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		User user = null;
		
		String query = prop.getProperty("selectUser");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				user = new User(rset.getString("USER_ID"),
								rset.getString("USER_PWD"),
								rset.getString("USER_NAME"),
								rset.getString("PHONE"),
								rset.getString("EMAIL"),
								rset.getString("MANAGER"),
								rset.getDate("ENROLL_DATE"),
								rset.getDate("MODIFY_DATE"),
								rset.getString("STATUS"));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return user;
	}
	
	public int deleteUser(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteUser");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
	

