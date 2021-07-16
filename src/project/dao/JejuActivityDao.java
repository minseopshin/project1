package project.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import project.dto.JejuActivityDto;

public class JejuActivityDao {
	Connection conn;
	public JejuActivityDao() throws Exception	{
		Class.forName("com.mysql.jdbc.Driver");
		String db="jdbc:mysql://localhost/project";
		conn=DriverManager.getConnection(db,"root","tlsalstjq78");
	}
	public JejuActivityDto jeju_activity_content(HttpServletRequest request) throws Exception	{
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String sql = "select * from activity where id=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		JejuActivityDto jdto = new JejuActivityDto();
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
	public ArrayList<JejuActivityDto> jeju_activity_photo(HttpServletRequest request) throws Exception	{
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String sql = "select activityphoto.* from activity,activityphoto where activity.title = activityphoto.activitytitle and activity.id=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<JejuActivityDto> jalist = new ArrayList<>();
		while (rs.next())	{
			JejuActivityDto jdto = new JejuActivityDto();
			jdto.setId(rs.getInt("id"));
			jdto.setTitle(rs.getString("activitytitle"));
			jdto.setPhoto(rs.getString("photo"));
			
			jalist.add(jdto);
		}
		return jalist;
	}
	public int jejuactivity_count() throws Exception	{
		String sql="select count(*) as cnt from activity";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    
	    ResultSet rs=pstmt.executeQuery();
	    rs.next();
	    int cnt=rs.getInt("cnt");
	    
	    return cnt;
	}
	public ArrayList<JejuActivityDto> jejuactivity_search(HttpServletRequest request,int index) throws Exception {
		request.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");
		String searchmenu = request.getParameter("searchmenu");
		String searchname = "%"+search+"%";
		ArrayList<JejuActivityDto> jlist = new ArrayList<>();
	
		if(searchmenu.equals("title"))	{
			String sql = "select * from activity where title like ? order by id limit ?,6";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchname);
			pstmt.setInt(2,index);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())	{
				JejuActivityDto jdto = new JejuActivityDto();
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
			String sql = "select * from activity where addr like ? order by id limit ?,6";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchname);
			pstmt.setInt(2, index);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())	{
				JejuActivityDto jdto = new JejuActivityDto();
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
	public int jeju_activity_search_cnt(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");
		String searchmenu = request.getParameter("searchmenu");
		String searchname = "%"+search+"%";
		int cnt = 0 ;
		
		if(searchmenu.equals("title"))	{
			String sql = "select count(*) as cnt from activity where title like ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchname);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			cnt=rs.getInt("cnt");
		}
		
		if(searchmenu.equals("addr"))	{
			String sql = "select count(*) as cnt from activity where addr like ? ";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchname);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			cnt=rs.getInt("cnt");
		}
		return cnt;
	}
}
	
	
	