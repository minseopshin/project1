package project.dao;

import java.io.UnsupportedEncodingException;
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

import project.dto.BoardDto;

public class BoardDao {
	
	Connection conn;
	public BoardDao() throws Exception
	{
		//DB연결
		Class.forName("com.mysql.jdbc.Driver");
		String db="jdbc:mysql://localhost/project";
		conn=DriverManager.getConnection(db,"root","tlsalstjq78");
	}
	public void write_ok(HttpServletRequest request,
			HttpServletResponse response,HttpSession session) throws Exception
	{
//		수정 05/03 => path 경로, multi.getParameter, 쿼리문 viewcount 삭제
		/*HttpSession session = request.getSession();*/
		
		String path=request.getRealPath("/board/img");
		int size=1024*1024*10;

		MultipartRequest multi=new MultipartRequest(
				request,path,size,"utf-8",new DefaultFileRenamePolicy());
		
		String title=multi.getParameter("title");
		String userid=(String)session.getAttribute("userid");
		String content=multi.getParameter("content");
		String fname=multi.getFilesystemName("fname");
		
		String sql="insert into board(title,userid,content,fname,reportingdate) ";
		sql=sql+" values(?,?,?,?,now())";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, title);
		pstmt.setString(2, userid);
		pstmt.setString(3, content);
		pstmt.setString(4, fname);
	
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("list.jsp");
	}
	public ArrayList<BoardDto> list() throws Exception
	{
		String sql="select b.* ,m.kakao from board as b, member as m where m.userid=b.userid order by id desc";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		
		ArrayList<BoardDto> list=new ArrayList<BoardDto>();
		while(rs.next())
		{
			BoardDto bdto=new BoardDto();
			bdto.setId(rs.getInt("id"));
			bdto.setUserid(rs.getString("userid"));
			bdto.setTitle(rs.getString("title"));
			bdto.setContent(rs.getString("content"));
			bdto.setFname(rs.getString("fname"));
			bdto.setViewcount(rs.getInt("viewcount"));
			bdto.setReportingdate(rs.getString("reportingdate"));
			bdto.setSingo(rs.getInt("singo"));
			bdto.setState(rs.getInt("state"));
			
			list.add(bdto);
		}
		
		return list;
	}
	public BoardDto content(HttpServletRequest request) throws Exception
	{
		String id=request.getParameter("id");
		String sql="select * from board where id=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		
		BoardDto bdto=new BoardDto();
		bdto.setId(rs.getInt("id"));
		bdto.setUserid(rs.getString("userid"));
		bdto.setTitle(rs.getString("title"));
		bdto.setContent(rs.getString("content").replace("\r\n", "<br>"));
		bdto.setFname(rs.getString("fname"));
		bdto.setViewcount(rs.getInt("viewcount"));
		bdto.setReportingdate(rs.getString("reportingdate"));
		
		return bdto;
	}
	public void delete(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String id=request.getParameter("id");
		
		String sql="delete from board where id=?";
	
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("list.jsp");
	
	}
	public void update_ok(HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{	
		// 수정 0503 => path, multi, 수정 if문
		String path=request.getRealPath("/board/img");
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
			sql="update board set title=?,content=? where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, id);
		}
		else
		{
			sql="update board set title=?,content=?,fname=? where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, fname);
			pstmt.setString(4, id);
		}
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("content.jsp?id="+id);
	}
	public void viewcount(HttpServletResponse response,HttpServletRequest request) throws Exception
	{
		String id=request.getParameter("id");
		
		
		
		String sql="update board set viewcount=viewcount+1 where id=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("content.jsp?id="+id);
		
	}
	public void blind_content(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		int state=Integer.parseInt(request.getParameter("state"));

		if(state==0)
		{
			String sql="update board set state=1 where id=?";
			
			PreparedStatement pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, id);

			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}
		else
		{
			String sql2="update board set state=0 where id=?";
			
			PreparedStatement pstmt=conn.prepareStatement(sql2);

			pstmt.setString(1, id);

			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}
		
		
		response.sendRedirect("board_content_mange.jsp");
	}
	public void singo_ok(HttpServletResponse response,HttpServletRequest request) throws Exception
	{
		
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String scontent=request.getParameter("scontent");
		String sname1=null;
		int sname=Integer.parseInt(request.getParameter("sname"));
		
		if(sname==1)
			sname1="부적절한 아이디";
		else if(sname==2)
			sname1="부적절한 홍보 게시글";
		else if(sname==3)
			sname1="음란성 또는 청소년에게 부적합한 내용";
		else if(sname==4)
			sname1="명예훼손/사생활 침해 등";
		else if(sname==5)
			sname1="불법촬영물등 신고";
		else if(sname==6)
			sname1="부적절한 프로필 사진";
		else if(sname==7)
			sname1="기타";
		
		String baduser=request.getParameter("userid");
		String singo=request.getParameter("singo");
		String state=request.getParameter("state");
		
		String sql="insert into singo(baduser,state,sname,scontent) ";
		sql=sql+" values(?,?,?,?)";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, baduser);
		pstmt.setInt(2, Integer.parseInt(state));
		pstmt.setString(3, sname1);
		pstmt.setString(4, scontent);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("singo_ook.jsp?id="+id+"&singo="+singo);

	}
	public void singo_ook(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		
		String sql="update board set singo=singo+1 where id=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("content.jsp?id="+id);
		
	}
	public void delete_content(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String id=request.getParameter("id");
		
		String sql="delete from board where id=?";
	
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("board_content_mange.jsp");
	
	}
}
