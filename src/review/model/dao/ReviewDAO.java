package review.model.dao;
import static common.JDBCTemplate.*;
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


import page.PageInfo;
import review.model.vo.Review;

public class ReviewDAO {
private Properties prop=null;
	
	public ReviewDAO() {
		
		prop =new Properties();
		String fileName=ReviewDAO.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList selectRList(Connection conn) {
		Statement stmt=null;
		ResultSet rset=null;
		ArrayList<Review> rList=null;
		String query=prop.getProperty("selectRList");
		
		try {
			stmt=conn.createStatement();
			rList=new ArrayList<Review>();
			rset=stmt.executeQuery(query);
			while(rset.next()) {
				rList.add(new Review(rset.getInt("IMG_NO"),
						             rset.getString())
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		return null;
	}

}
