package User.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import User.model.dao.ShppingDAO;
import User.model.vo.Shpping;

public class ShppingService {
	private ShppingDAO sDAO = new ShppingDAO();
	
	public int insertShpping(Shpping sp) {
		Connection conn = getConnection();
		int result = sDAO.insertShpping(conn,sp);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Shpping> selectShpping(String userId) {
		Connection conn = getConnection();
		ArrayList<Shpping> list = sDAO.selectShpping(conn,userId);
		close(conn);
		return list;
	}

	public int selectBasicsShpping(String userId) {
		Connection conn = getConnection();
		int bNum = sDAO.selectBasicsShpping(conn, userId);
		close(conn);
		return bNum;
	}

	public int deleteBasicsShpping(int bNum) {
		Connection conn = getConnection();
		int deleteB = sDAO.deleteBasicsShpping(conn, bNum);
		if(deleteB > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return deleteB;
	}

}
