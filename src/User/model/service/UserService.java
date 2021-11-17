package User.model.service;


import static common.JDBCTemplate.*;

import java.sql.Connection;

import User.model.dao.UserDAO;
import User.model.vo.User;


public class UserService {
	
	private UserDAO mDAO = new UserDAO();

	public int checkId(String inputId) {
		Connection conn = getConnection();
		int result = mDAO.checkId(conn,inputId);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public User login(String userId, String userPwd) {
		Connection conn = getConnection();
		User m = mDAO.login(conn,userId,userPwd);
		close(conn);
		return m;
	}

	public String idFindResult(String userName, String email) {
		Connection conn = getConnection();
		String id = mDAO.idFindResult(conn,userName, email);
		close(conn);
		return id;
	}

	public User userIdsearch(String userId) {
		Connection conn = getConnection();
		User m = mDAO.UserIdsearch(conn,userId);
		close(conn);
		return m;
	}

	public int insertUser(User user) {
		Connection conn = getConnection();
		int result = mDAO.insertUser(conn,user);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
}
