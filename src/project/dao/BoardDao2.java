package project.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import project.dto.BoardDto2;

public class BoardDao2 {
	
	Connection conn;
	public BoardDao2() throws Exception
	{
		//DB연결
		Class.forName("com.mysql.jdbc.Driver");
		String db="jdbc:mysql://localhost/project";
		conn=DriverManager.getConnection(db,"root","tlsalstjq78");
	}
	
	
	public void write_ok2(HttpServletRequest request,
			HttpServletResponse response,HttpSession session) throws Exception
	{

		
		String path=request.getRealPath("/board2/img");
		int size=1024*1024*10;

		MultipartRequest multi=new MultipartRequest(
				request,path,size,"utf-8",new DefaultFileRenamePolicy());
		
		String title=multi.getParameter("title");
		String userid=(String)session.getAttribute("userid");
		String content=multi.getParameter("content");
		String fname=multi.getFilesystemName("fname");
		
		String sql="insert into board2(title,userid,content,fname,reportingdate) ";
		sql=sql+" values(?,?,?,?,now())";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, title);
		pstmt.setString(2, userid);
		pstmt.setString(3, content);
		pstmt.setString(4, fname);
	
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("list2.jsp");
	}
	
	
	public ArrayList<BoardDto2> list() throws Exception
	{
		String sql="select b.* ,m.kakao from board2 as b, member as m where m.userid=b.userid order by id desc";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		
		ArrayList<BoardDto2> list=new ArrayList<BoardDto2>();
		while(rs.next())
		{
			BoardDto2 bdto2=new BoardDto2();
			bdto2.setId(rs.getInt("id"));
			bdto2.setUserid(rs.getString("userid"));
			bdto2.setTitle(rs.getString("title"));
			bdto2.setContent(rs.getString("content"));
			bdto2.setFname(rs.getString("fname"));
			bdto2.setViewcount(rs.getInt("viewcount"));
			bdto2.setReportingdate(rs.getString("reportingdate"));
			
			list.add(bdto2);
		}
		
		return list;
	}
	public BoardDto2 content2(HttpServletRequest request) throws Exception
	{
		String id=request.getParameter("id");
		String sql="select * from board2 where id=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		
		BoardDto2 bdto2=new BoardDto2();
		bdto2.setId(rs.getInt("id"));
		bdto2.setUserid(rs.getString("userid"));
		bdto2.setTitle(rs.getString("title"));
		bdto2.setContent(rs.getString("content").replace("\r\n", "<br>"));
		bdto2.setFname(rs.getString("fname"));
		bdto2.setViewcount(rs.getInt("viewcount"));
		bdto2.setReportingdate(rs.getString("reportingdate"));
		
		return bdto2;
	}
	public void delete2(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String id=request.getParameter("id");
		
		String sql="delete from board2 where id=?";
	
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("list2.jsp");
	
	}
	public void update_ok2(HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{	
		// 수정 0503 => path, multi, 수정 if문
		String path=request.getRealPath("/board2/img");
		int size=1024*1024*10;

		MultipartRequest multi=new MultipartRequest(
				request,path,size,"utf-8",new DefaultFileRenamePolicy());
		
		request.setCharacterEncoding("utf-8");
		String title=multi.getParameter("title");
		String userid=multi.getParameter("userid");
		String content=multi.getParameter("content");
		String fname=multi.getFilesystemName("fname");
		String id=multi.getParameter("id");
		
		String sql=null;
		PreparedStatement pstmt=null;
		if(fname == null)
		{
			sql="update board2 set title=?,content=? where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, id);
		}
		else
		{
			sql="update board2 set title=?,content=?,fname=? where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, fname);
			pstmt.setString(4, id);
		}
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("content2.jsp?id="+id);
	}
	public void viewcount2(HttpServletResponse response,HttpServletRequest request) throws Exception
	{
		String id=request.getParameter("id");
		
		String sql="update board2 set viewcount=viewcount+1 where id=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("content2.jsp?id="+id);
	}
	public void blind_content2(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		int state=Integer.parseInt(request.getParameter("state"));

		if(state==0)
		{
			String sql="update board2 set state=1 where id=?";
			
			PreparedStatement pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, id);

			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}
		else
		{
			String sql2="update board2 set state=0 where id=?";
			
			PreparedStatement pstmt=conn.prepareStatement(sql2);

			pstmt.setString(1, id);

			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}
		
		
		response.sendRedirect("f_board_content_mange.jsp");
	}
	public void delete_content2(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String id=request.getParameter("id");
		
		String sql="delete from board2 where id=?";
	
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("f_board_content_mange.jsp");
	
	}
}
