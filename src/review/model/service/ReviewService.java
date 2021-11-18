package review.model.service;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

/*import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.PageInfo;
import board.model.vo.Reply;*/

import page.PageInfo;
import review.model.dao.ReviewDAO;
import review.model.vo.Review;


public class ReviewService {
	private ReviewDAO rDAO=new ReviewDAO();

	public ArrayList selectTList(int i) {
		Connection conn=getConnection();
		ArrayList list=null;
		if(i==1) {
			list=rDAO.selectRList(conn);
		}else {
			list=rDAO.selectFList(conn);
		}
		close(conn);
		
		return null;
	}
	
	
	
	
	
	
	
	
}
