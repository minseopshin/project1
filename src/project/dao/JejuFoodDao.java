package project.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import project.dto.JejuFoodDto;

public class JejuFoodDao {
	Connection conn;
	public JejuFoodDao() throws Exception	{
		Class.forName("com.mysql.jdbc.Driver");
		String db="jdbc:mysql://localhost/project";
		conn=DriverManager.getConnection(db,"root","tlsalstjq78");
	}
	public JejuFoodDto jeju_food_content(HttpServletRequest request) throws Exception	{
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String sql = "select * from food where id=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		JejuFoodDto jdto = new JejuFoodDto();
		jdto.setId(rs.getInt("id"));
		jdto.setAddr(rs.getString("addr"));
		jdto.setContent(rs.getString("content"));
		jdto.setImgpath(rs.getString("imgpath"));
		jdto.setIntroduction(rs.getString("introduction"));
		jdto.setRoadaddr(rs.getString("roadaddr"));
		jdto.setPhone(rs.getString("phone"));
		jdto.setThumbnailpath(rs.getString("thumbnailpath"));
		jdto.setTitle(rs.getString("title"));
		
		return jdto;
	}
	public ArrayList<JejuFoodDto> jeju_food_photo(HttpServletRequest request) throws Exception	{
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String sql = "select foodphoto.* from food,foodphoto where food.title = foodphoto.foodtitle and food.id=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<JejuFoodDto> jclist = new ArrayList<>();
		while (rs.next())	{
			JejuFoodDto jdto = new JejuFoodDto();
			jdto.setId(rs.getInt("id"));
			jdto.setTitle(rs.getString("foodtitle"));
			jdto.setPhoto(rs.getString("photo"));
			
			jclist.add(jdto);
		}
		return jclist;
	}
	public int jejufood_count() throws Exception	{
		String sql="select count(*) as cnt from food";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    
	    ResultSet rs=pstmt.executeQuery();
	    rs.next();
	    int cnt=rs.getInt("cnt");
	    
	    return cnt;
	}
	public ArrayList<JejuFoodDto> jejufood_search(HttpServletRequest request,int index) throws Exception {
		request.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");
		String searchmenu = request.getParameter("searchmenu");
		String searchname = "%"+search+"%";
		ArrayList<JejuFoodDto> jlist = new ArrayList<>();
		
		if(searchmenu.equals("title"))	{
			String sql = "select * from food where title like ? order by id limit ?,6";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchname);
			pstmt.setInt(2,index);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())	{
				JejuFoodDto jdto = new JejuFoodDto();
				jdto.setId(rs.getInt("id"));
				jdto.setAddr(rs.getString("addr"));
				jdto.setContent(rs.getString("content"));
				jdto.setImgpath(rs.getString("imgpath"));
				jdto.setIntroduction(rs.getString("introduction"));
				jdto.setRoadaddr(rs.getString("roadaddr"));
				jdto.setPhone(rs.getString("phone"));
				jdto.setThumbnailpath(rs.getString("thumbnailpath"));
				jdto.setTitle(rs.getString("title"));
				
				jlist.add(jdto);
			}
		}
		if(searchmenu.equals("addr"))	{
			String sql = "select * from food where addr like ? order by id limit ?,6";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchname);
			pstmt.setInt(2, index);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())	{
				JejuFoodDto jdto = new JejuFoodDto();
				jdto.setId(rs.getInt("id"));
				jdto.setAddr(rs.getString("addr"));
				jdto.setContent(rs.getString("content"));
				jdto.setImgpath(rs.getString("imgpath"));
				jdto.setIntroduction(rs.getString("introduction"));
				jdto.setRoadaddr(rs.getString("roadaddr"));
				jdto.setPhone(rs.getString("phone"));
				jdto.setThumbnailpath(rs.getString("thumbnailpath"));
				jdto.setTitle(rs.getString("title"));
				
				jlist.add(jdto);
			}
		}
		return jlist;	
	}
	public int jeju_food_search_cnt(HttpServletRequest request) throws Exception {
		String search = request.getParameter("search");
		String searchmenu = request.getParameter("searchmenu");
		String searchname = "%"+search+"%";
		int cnt = 0 ;
		
		if(searchmenu.equals("title"))	{
			String sql = "select count(*) as cnt from food where title like ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchname);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			cnt=rs.getInt("cnt");
		}
		
		if(searchmenu.equals("addr"))	{
			String sql = "select count(*) as cnt from food where addr like ? ";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchname);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			cnt=rs.getInt("cnt");
		}
		return cnt;
	}
}
	
	
	