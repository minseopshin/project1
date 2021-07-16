package project.dao;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import project.dto.MemberDto;

public class MemberDao {
	
	Connection conn;
	public MemberDao() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		String db="jdbc:mysql://localhost/project";
		conn=DriverManager.getConnection(db,"root","tlsalstjq78");
	}
	
	// 회원 가입
	public void member_ok(
			HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		String kakao=request.getParameter("kakao");
		String phone=request.getParameter("phone");
		String birth=request.getParameter("birth");
		String gender=request.getParameter("gender");
		
		String sql="insert into member(userid,pwd,email,kakao,phone,birth,gender) ";
		sql=sql+" values(?,?,?,?,?,?,?)";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, pwd);
		pstmt.setString(3, email);
		pstmt.setString(4, kakao);
		pstmt.setString(5, phone);
		pstmt.setString(6, birth);
		pstmt.setString(7, gender);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("login.jsp");
	}
	
	// 아이디 중복 확인
	public void userid_check(HttpServletRequest request,
			JspWriter out) throws Exception
	{
		String userid=request.getParameter("userid");
		
		String sql="select * from member where userid=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		
		ResultSet rs=pstmt.executeQuery();
		
		if(rs.next())
			out.print("1");
		else
			out.print("0");
	}
	
	// 로그인
	public int login_ok(HttpSession session,
			HttpServletRequest request) throws Exception
	{
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		
		String sql="select * from member where userid=? and pwd=? and state=0";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, pwd);
		
		ResultSet rs=pstmt.executeQuery();
		
		int chk=0;
		if(rs.next())
		{
			session.setAttribute("userid", rs.getString("userid"));
		}
		else
		{
			chk=1;
		}
		return chk;
	}
	
	// 아이디 찾기
	public void userid_search_ok(HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		
		String sql="select userid from member where email=? and phone=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, phone);
		
		ResultSet rs=pstmt.executeQuery();
		
		int chk=1;
		if(rs.next())
		{
			session.setAttribute("idid", rs.getString("userid"));
			chk=0;
		}
		
		response.sendRedirect("userid_search.jsp?chk="+chk);
	}
	
	// 비밀번호 찾기
	public void pwd_search_ok(HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String userid=request.getParameter("userid");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		
		String sql="select pwd from member where userid=? and email=? and phone=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, email);
		pstmt.setString(3, phone);
		
		ResultSet rs=pstmt.executeQuery();
		
		int chk=1;
		if(rs.next())
		{
			session.setAttribute("pwd", rs.getString("pwd"));
			chk=0;
		}
		
		response.sendRedirect("pwd_search.jsp?chk="+chk);
	}
	
	// 회원 정보 보기
	public MemberDto member_info(HttpSession session) throws Exception
	{
		String userid=session.getAttribute("userid").toString();
		
		String sql="select * from member where userid=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		
		MemberDto mdto=new MemberDto();
		mdto.setId(rs.getInt("id"));
		mdto.setUserid(rs.getString("userid"));
		mdto.setEmail(rs.getString("email"));
		mdto.setKakao(rs.getString("kakao"));
		mdto.setPhone(rs.getString("phone"));
		mdto.setBirth(rs.getInt("birth"));
		
		return mdto;
	}
	
	// 회원 정보 수정
	public void member_update_ok(
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String email=request.getParameter("email");
		String kakao=request.getParameter("kakao");
		String phone=request.getParameter("phone");
		String userid=session.getAttribute("userid").toString();
		
		String sql="update member set email=?,kakao=?,phone=? where userid=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, kakao);
		pstmt.setString(3, phone);
		pstmt.setString(4, userid);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("member_info.jsp");
	}
	
	// 회원 탈퇴
	public void member_out(
			HttpSession session,
			HttpServletResponse response) throws Exception
	{
		String userid=session.getAttribute("userid").toString();
		
		String sql="update member set state=1 where userid=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		session.invalidate();
		
		response.sendRedirect("../main/index.jsp");
	}
	// mlist 추가 => admin=>userchk(회원관리).jsp에서 사용
	public ArrayList<MemberDto> mlist() throws Exception
	{
		String sql="select * from member order by id desc";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		
		ArrayList<MemberDto> mlist=new ArrayList<MemberDto>();
		while(rs.next())
		{
			MemberDto mdto=new MemberDto();
			mdto.setUserid(rs.getString("userid"));
			mdto.setEmail(rs.getString("email"));
			mdto.setKakao(rs.getString("kakao"));
			mdto.setPhone(rs.getString("phone"));
			mdto.setBirth(rs.getInt("birth"));
			mdto.setGender(rs.getInt("gender"));
			mdto.setState(rs.getInt("state"));
			
			mlist.add(mdto);
		}
		
		return mlist;
	}
	// admin/user_delete.jsp에서 사용
	public void user_state_change(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String id=request.getParameter("id");
		int state=Integer.parseInt(request.getParameter("state"));
		
		if(state==0)
		{
			String sql="update member set state=1 where id=?";
			
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}
		else if(state==1)
		{
			String sql2="update member set state=0 where id=?";
			
			PreparedStatement pstmt=conn.prepareStatement(sql2);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}
		
		response.sendRedirect("ulist.jsp");
	}
	// admin/user_delete.jsp에서 사용
	public void user_delete(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String id=request.getParameter("id");
		
		String sql="delete from member where id=?";
	
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("ulist.jsp");
	}
	
	
	public void password_check_ok(HttpServletRequest request,HttpSession session,JspWriter out) throws Exception	{
		String userid = (String) session.getAttribute("userid");
		String pwd = request.getParameter("password");
		String sql = "select * from member where userid=? and pwd = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, pwd);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next())	{
			out.print("1");
		}
		else	{
			out.print("0");
		}
	}
	
	
	
	
}

