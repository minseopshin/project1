package project.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.dto.NoticeDto;

public class NoticeDao {
	
	Connection conn;
	public NoticeDao() throws Exception
	{
		//DB연결
		Class.forName("com.mysql.jdbc.Driver");
		String db="jdbc:mysql://localhost/project";
		conn=DriverManager.getConnection(db,"root","tlsalstjq78");
	}
	// 공지사항 글쓰기
	public void nwrite_ok(HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String viewcount=request.getParameter("viewcount");
		
		String sql="insert into notice(title,content,viewcount,reportingdate) ";
		sql=sql+" values(?,?,0,now())";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		/*pstmt.setString(3, viewcount);*/
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("nlist.jsp");
	}
	// 공지사항 내용 읽어 오기
	public ArrayList<NoticeDto> nlist() throws Exception
	{
		String sql="select * from notice order by id desc";
		
		Statement stmt=conn.createStatement();
		
		ResultSet rs=stmt.executeQuery(sql);
		
		ArrayList<NoticeDto> nlist=new ArrayList<NoticeDto>();
		while(rs.next())
		{
			NoticeDto ndto=new NoticeDto();
			ndto.setId(rs.getInt("id"));
			ndto.setTitle(rs.getString("title"));
			ndto.setContent(rs.getString("content"));
			ndto.setViewcount(rs.getString("viewcount"));
			ndto.setReportingdate(rs.getString("reportingdate"));
			
			nlist.add(ndto);
		}
		
		return nlist;
	}

	public NoticeDto ncontent(HttpServletRequest request) throws Exception
	{
		
		String id=request.getParameter("id");
		
		String sql1="update notice set viewcount=viewcount+1 where id="+id;
		Statement stmt=conn.createStatement();
        stmt.executeUpdate(sql1);
		stmt.close();
		
		String sql="select * from notice where id=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		
		NoticeDto ndto=new NoticeDto();
		ndto.setId(rs.getInt("id"));
		ndto.setTitle(rs.getString("title"));
		ndto.setContent(rs.getString("content"));
		ndto.setViewcount(rs.getString("viewcount"));
		ndto.setReportingdate(rs.getString("reportingdate"));
		
		return ndto;
	}

	public void ndelete(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String id=request.getParameter("id");
		String sql="delete from notice where id=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("nlist.jsp");
	}
	 public NoticeDto update(HttpServletRequest request) throws Exception
     {
         String id=request.getParameter("id");
              
         String sql="select * from notice where id="+id;
         
         // 심부름꾼 생성
         Statement stmt=conn.createStatement();
         
         // 쿼리 실행 => ResultSet
         ResultSet rs=stmt.executeQuery(sql);
         rs.next();
         
         NoticeDto ndto=new NoticeDto();
 		 ndto.setId(rs.getInt("id"));
 		 ndto.setTitle(rs.getString("title"));
 		 ndto.setContent(rs.getString("content"));
 		 ndto.setViewcount(rs.getString("viewcount"));
 		 ndto.setReportingdate(rs.getString("reportingdate"));
 		
 		 return ndto;
     }
	public void nupdate_ok(HttpServletRequest request) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String title=request.getParameter("title");
		String content=request.getParameter("content");

		String sql="update notice set title=?,content=? where id=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, id);

		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();

	}
}
