package project.dao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.dto.ReserveDto;
import project.dto.ReserveJoinDto;

public class ReserveDao {
	Connection conn;
	public ReserveDao() throws Exception	{
		Class.forName("com.mysql.jdbc.Driver");
		String db="jdbc:mysql://localhost/project";
		conn=DriverManager.getConnection(db,"root","tlsalstjq78");
	}
	public ArrayList<ReserveDto> reserve_board(HttpServletRequest request,HttpSession session,int index) throws Exception	{
		String y = request.getParameter("year");
		String m = request.getParameter("month");
		String d = request.getParameter("day");
		String userid = (String) session.getAttribute("userid");
		
		int year = Integer.parseInt(y);
		int month = Integer.parseInt(m);
		int day = Integer.parseInt(d);
		LocalDate reserveday = LocalDate.of(year, month, day);
		String sql = "select *,coalesce((r2.a),0) as num from reserve as r1 left outer join (select reserveid,sum(joinnum) as a from reservejoin group by reserveid) as r2 on r1.id = r2.reserveid where date between ? and ? and coalesce((r1.min+r2.a),0) < r1.max order by id desc limit ?,10";
		String sql2 = "select * from member where userid=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, reserveday.toString());
		pstmt.setString(2, reserveday.toString());
		pstmt.setInt(3, index);
		PreparedStatement pstmt2 = conn.prepareStatement(sql2);
		pstmt2.setString(1, userid);
		
		ResultSet rs = pstmt.executeQuery();
		ResultSet rs2 = pstmt2.executeQuery();
		rs2.next();
		ArrayList<ReserveDto> list = new ArrayList<ReserveDto>();
		while(rs.next())	{
			ReserveDto rdto = new ReserveDto();
			rdto.setId(rs.getInt("id"));
			rdto.setTitle(rs.getString("title"));
			rdto.setContent(rs.getString("content"));
			rdto.setMax(rs.getInt("max"));
			rdto.setUserid(rs.getString("userid"));
			rdto.setMin(rs.getInt("min"));
			rdto.setGender(rs.getInt("gender"));
			rdto.setDate(rs.getString("date"));
			rdto.setNum(rs.getInt("num"));
			rdto.setGd(rs2.getInt("gender"));
			
			list.add(rdto);
		}
		return list;
	}
	public ReserveDto reserve_content(HttpServletRequest request) throws Exception	{
		String id = request.getParameter("id");
		String sql = "select *,coalesce((r2.a),0) as num from reserve as r1 left outer join (select reserveid,sum(joinnum) as a from reservejoin group by reserveid) as r2 on r1.id = r2.reserveid where r1.id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		ReserveDto rdto = new ReserveDto();
		rdto.setId(rs.getInt("id"));
		rdto.setTitle(rs.getString("title"));
		rdto.setContent(rs.getString("content"));
		rdto.setMax(rs.getInt("max"));
		rdto.setUserid(rs.getString("userid"));
		rdto.setNum(rs.getInt("num"));
		rdto.setGender(rs.getInt("gender"));
		rdto.setMin(rs.getInt("min"));
		rdto.setDate(rs.getString("date"));
		
		return rdto;
	}
	public int reserve_content2(HttpServletRequest request,HttpSession session) throws Exception	{
		String id = request.getParameter("id");
		String userid = (String) session.getAttribute("userid");
		String sql2 = "select * from reservejoin where reserveid =? and joinid=?";
		
		PreparedStatement pstmt2 = conn.prepareStatement(sql2);
		pstmt2.setString(2, userid);
		pstmt2.setString(1,id);
		ResultSet rs2 = pstmt2.executeQuery();
		int c = 0;
		if(rs2.next())	{
			c = 1;
		}
		
		return c;
	}
	public void reserve_ok(HttpServletRequest request,HttpSession session) throws Exception	{
		String reserveid = request.getParameter("id");
		String userid = (String) session.getAttribute("userid");
		String joinnum = request.getParameter("joinnum");
		String sql = "insert into reservejoin(reserveid,userid,joinnum) values(?,?,?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, reserveid);
		pstmt.setString(2, userid);
		pstmt.setString(3, joinnum);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
	}
	public ArrayList<ReserveDto> reserve_check(HttpSession session,int index) throws Exception	{
		String userid = (String) session.getAttribute("userid");
		String sql = "select *,coalesce((r2.a),0) as num from reserve as r1 left outer join (select *,sum(joinnum) as a from reservejoin group by reserveid) as r2 on r1.id = r2.reserveid where userid = ? order by reserveid desc limit ?,10";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setInt(2, index);
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<ReserveDto> rlist = new ArrayList<ReserveDto>();
		while(rs.next())	{
			ReserveDto rdto = new ReserveDto();
			rdto.setId(rs.getInt("id"));
			rdto.setTitle(rs.getString("title"));
			rdto.setContent(rs.getString("content"));
			rdto.setMax(rs.getInt("max"));
			rdto.setUserid(rs.getString("userid"));
			rdto.setMin(rs.getInt("min"));
			rdto.setGender(rs.getInt("gender"));
			rdto.setDate(rs.getString("date"));
			rdto.setNum(rs.getInt("num"));
			rlist.add(rdto);
		}
		
		return rlist;
	}
	public void reserve_write_ok(HttpServletRequest request,HttpSession session,HttpServletResponse response) throws Exception	{
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String gender = request.getParameter("gender");
		String max = request.getParameter("max");
		String userid = (String) session.getAttribute("userid");
		String date = request.getParameter("date");
		String min = request.getParameter("min");
		String sql = "insert into reserve (title,content,gender,min,max,userid,date) values(?,?,?,?,?,?,?)";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, gender);
		pstmt.setString(4, min);
		pstmt.setString(5, max);
		pstmt.setString(6, userid);
		pstmt.setString(7, date);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		//response.sendRedirect("reserve_board.jsp?date="+date);
	}
	public ReserveDto reserve_board_current(HttpSession session) throws Exception	{
		String userid = (String) session.getAttribute("userid");
		String sql = "select * from reserve where userid=? order by id desc limit 1";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		ReserveDto rdto = new ReserveDto();
		rdto.setId(rs.getInt("id"));
		rdto.setTitle(rs.getString("title"));
		rdto.setContent(rs.getString("content"));
		rdto.setMax(rs.getInt("max"));
		rdto.setUserid(rs.getString("userid"));
		rdto.setMin(rs.getInt("min"));
		rdto.setGender(rs.getInt("gender"));
		rdto.setDate(rs.getString("date"));
		
		return rdto;
	}
	public void reserve_join_ok(HttpServletRequest request,HttpSession session) throws Exception	{
		String userid = (String) session.getAttribute("userid");
		String reserveid = request.getParameter("reserveid");
		String joinnum = request.getParameter("joinnum");
		
		String sql = "insert into reservejoin(joinid,reserveid,joinnum) values(?,?,?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, reserveid);
		pstmt.setString(3, joinnum);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public ReserveJoinDto reserve_join_current(HttpServletRequest request,HttpSession session) throws Exception	{
		String joinid = (String) session.getAttribute("userid");
		String id = request.getParameter("id");
		String sql = "select r1.* , r2.*, (select sum(joinnum+min) from reservejoin as r1, reserve as r2 where r1.reserveid = r2.id and r1.reserveid=? group by reserveid) as num from reservejoin as r1, reserve as r2 where joinid=? and r1.reserveid = r2.id order by r1.id desc limit 1";
		String sql2 = "select m1.* from member as m1,reserve as r1 where r1.id = ? and m1.userid = r1.userid";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, joinid);
		PreparedStatement pstmt2 = conn.prepareStatement(sql2);
		pstmt2.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		ResultSet rs2 = pstmt2.executeQuery();
		rs.next();
		rs2.next();
		ReserveJoinDto rjdto = new ReserveJoinDto();
		rjdto.setId(rs.getInt("id"));
		rjdto.setJoinid(rs.getString("joinid"));
		rjdto.setJoinnum(rs.getInt("joinnum"));
		rjdto.setReserveid(rs.getInt("reserveid"));
		rjdto.setNum(rs.getInt("num"));
		rjdto.setMax(rs.getInt("max"));
		rjdto.setTitle(rs.getString("title"));
		rjdto.setContent(rs.getString("content"));
		rjdto.setEmail(rs2.getString("email"));
		rjdto.setKakao(rs2.getString("kakao"));
		rjdto.setDate(rs.getString("date"));
		
		return rjdto;
	}
	public ArrayList<ReserveJoinDto> reservejoin_check(HttpSession session,int index) throws Exception	{
		String userid = (String) session.getAttribute("userid");
		String sql = "select *,coalesce((r2.a),0) as num from reserve as r1 left outer join (select *,sum(joinnum) as a from reservejoin group by reserveid) as r2 on r1.id = r2.reserveid where joinid=? order by reserveid desc limit ?,10";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,userid);
		pstmt.setInt(2, index);
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<ReserveJoinDto> rjlist = new ArrayList<ReserveJoinDto>();
		while(rs.next())	{
			ReserveJoinDto rjdto = new ReserveJoinDto();
			rjdto.setId(rs.getInt("id"));
			rjdto.setJoinid(rs.getString("joinid"));
			rjdto.setMin(rs.getInt("min"));
			rjdto.setReserveid(rs.getInt("reserveid"));
			rjdto.setTitle(rs.getString("title"));
			rjdto.setMax(rs.getInt("max"));
			rjdto.setNum(rs.getInt("num"));
			rjdto.setDate(rs.getString("date"));
			
			rjlist.add(rjdto);
		}
		return rjlist;
	}
	public ReserveJoinDto reserve_join_content(HttpServletRequest request,HttpSession session) throws Exception	{
		String joinid = (String) session.getAttribute("userid");
		String id = request.getParameter("id");
		String sql = "select r1.* , r2.*, (select sum(joinnum+min) from reservejoin as r1, reserve as r2 where r1.reserveid = r2.id and r1.reserveid=? group by reserveid) as num from reservejoin as r1, reserve as r2 where joinid=? and r1.reserveid = r2.id";
		String sql2 = "select m1.* from member as m1,reserve as r1 where r1.id = ? and m1.userid = r1.userid";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, joinid);
		PreparedStatement pstmt2 = conn.prepareStatement(sql2);
		pstmt2.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		ResultSet rs2 = pstmt2.executeQuery();
		rs.next();
		rs2.next();
		ReserveJoinDto rjdto = new ReserveJoinDto();
		rjdto.setId(rs.getInt("id"));
		rjdto.setJoinid(rs.getString("joinid"));
		rjdto.setJoinnum(rs.getInt("joinnum"));
		rjdto.setReserveid(rs.getInt("reserveid"));
		rjdto.setNum(rs.getInt("num"));
		rjdto.setMax(rs.getInt("max"));
		rjdto.setTitle(rs.getString("title"));
		rjdto.setContent(rs.getString("content"));
		rjdto.setEmail(rs2.getString("email"));
		rjdto.setKakao(rs2.getString("kakao"));
		rjdto.setDate(rs.getString("date"));
		
		return rjdto;
	}
	public ReserveDto reserve_update(HttpServletRequest request) throws Exception	{
		String id = request.getParameter("id");
		String sql = "select * from reserve where id=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		ReserveDto rdto = new ReserveDto();
		rdto.setId(rs.getInt("id"));
		rdto.setTitle(rs.getString("title"));
		rdto.setContent(rs.getString("content"));
		rdto.setMax(rs.getInt("max"));
		rdto.setUserid(rs.getString("userid"));
		rdto.setMin(rs.getInt("min"));
		rdto.setGender(rs.getInt("gender"));
		rdto.setDate(rs.getString("date"));
		
		return rdto;
	}
	public void reserve_update_ok(HttpServletRequest request) throws Exception	{
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String min = request.getParameter("min");
		String max = request.getParameter("max");
		String gender = request.getParameter("gender");
		
		String sql = "update reserve set title=?, content=?, min=?, max=?, gender=? where id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, min);
		pstmt.setString(4, max);
		pstmt.setString(5, gender);
		pstmt.setString(6, id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		
	}
	public void reserve_delete(HttpServletRequest request) throws Exception	{
		String id = request.getParameter("id");
		String sql = "delete from reserve where id=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
	}
	public ReserveJoinDto reserve_join_update(HttpServletRequest request,HttpSession session) throws Exception	{
		String joinid = (String) session.getAttribute("userid");
		String id = request.getParameter("id");
		String sql = "select *,coalesce(a,0) as num from reserve as r1 left  outer join (select *,sum(joinnum) as a from reservejoin where joinid = ? group by reserveid ) as r2 on r1.id = r2.reserveid where reserveid=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, joinid);
		pstmt.setString(2, id);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		ReserveJoinDto rjdto = new ReserveJoinDto();
		rjdto.setId(rs.getInt("id"));
		rjdto.setJoinnum(rs.getInt("joinnum"));
		rjdto.setTitle(rs.getString("title"));
		rjdto.setContent(rs.getString("content"));
		rjdto.setDate(rs.getString("date"));
		return rjdto;
	}
	public void reserve_join_update_ok(HttpServletRequest request) throws Exception	{
		String id = request.getParameter("id");
		String joinnum = request.getParameter("joinnum");
		String sql = "update reservejoin set joinnum=? where id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, joinnum);
		pstmt.setString(2, id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public void reserve_join_cancel(HttpServletRequest request) throws Exception	{
		String id = request.getParameter("id");
		String sql = "delete from reservejoin where id=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public int page_count(HttpServletRequest request) throws Exception	{
		String y = request.getParameter("year");
		String m = request.getParameter("month");
		String d = request.getParameter("day");
		
		int year = Integer.parseInt(y);
		int month = Integer.parseInt(m);
		int day = Integer.parseInt(d);
		LocalDate reserveday = LocalDate.of(year, month, day);
		String sql= "select count(*) as cnt from reserve as r1 left outer join (select reserveid,sum(joinnum) as a from reservejoin group by reserveid) as r2 on r1.id = r2.reserveid where date between ? and ? and coalesce((r1.min+r2.a),0) < r1.max";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, reserveday.toString());
	    pstmt.setString(2, reserveday.toString());
	    ResultSet rs=pstmt.executeQuery();
	    rs.next();
	    int cnt=rs.getInt("cnt");
	    
	    return cnt;
	       
	}
	public int page_check_count(HttpSession session) throws Exception	{
		String userid = (String) session.getAttribute("userid");
		
		String sql="select count(*) as cnt from reserve where userid=?";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, userid);
	    
	    ResultSet rs=pstmt.executeQuery();
	    rs.next();
	    int cnt=rs.getInt("cnt");
	    
	    return cnt;
	}
	public int joinpage_check_count(HttpSession session) throws Exception	{
		String userid = (String) session.getAttribute("userid");
		
		String sql="select count(*) as cnt from reserve as r1,reservejoin as r2 where r1.id=r2.reserveid and joinid=?";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, userid);
	    
	    ResultSet rs=pstmt.executeQuery();
	    rs.next();
	    int cnt=rs.getInt("cnt");
	    
	    return cnt;
	}
	public ReserveDto reserve_join(HttpServletRequest request) throws Exception	{
		String id = request.getParameter("id");
		String sql = "select * from reserve where id=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		ReserveDto rdto = new ReserveDto();
		rdto.setId(rs.getInt("id"));
		rdto.setTitle(rs.getString("title"));
		rdto.setContent(rs.getString("content"));
		rdto.setMax(rs.getInt("max"));
		rdto.setUserid(rs.getString("userid"));
		rdto.setMin(rs.getInt("min"));
		rdto.setGender(rs.getInt("gender"));
		rdto.setDate(rs.getString("date"));
		
		return rdto;
	}
	public ReserveJoinDto reserve_join_check_content(HttpServletRequest request,HttpSession session) throws Exception	{
		String joinid = (String) session.getAttribute("userid");
		if (joinid.equals("admin"))	{
			joinid = request.getParameter("joinid");
		}
		System.out.println(joinid);
		String id = request.getParameter("id");
		String sql = "select *,coalesce(a,0) as num from reserve as r1 left  outer join (select *,sum(joinnum) as a from reservejoin where joinid = ? group by reserveid ) as r2 on r1.id = r2.reserveid where reserveid=?"; 
		String sql2 = "select m1.* from member as m1,reserve as r1 where r1.id = ? and m1.userid = r1.userid";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, joinid);
		pstmt.setString(2, id);
		
		PreparedStatement pstmt2 = conn.prepareStatement(sql2);
		pstmt2.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		ResultSet rs2 = pstmt2.executeQuery();
		rs.next();
		rs2.next();
		ReserveJoinDto rjdto = new ReserveJoinDto();
		rjdto.setId(rs.getInt("id"));
		rjdto.setJoinid(rs.getString("joinid"));
		rjdto.setJoinnum(rs.getInt("joinnum"));
		rjdto.setReserveid(rs.getInt("reserveid"));
		rjdto.setMin(rs.getInt("min"));
		rjdto.setNum(rs.getInt("num"));
		rjdto.setMax(rs.getInt("max"));
		rjdto.setTitle(rs.getString("title"));
		rjdto.setContent(rs.getString("content"));
		rjdto.setEmail(rs2.getString("email"));
		rjdto.setKakao(rs2.getString("kakao"));
		rjdto.setDate(rs.getString("date"));
		
		return rjdto;
	}
	public void reserve_mange_delete(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String id=request.getParameter("id");
		
		String sql="delete from reserve where id=?";
	
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("reserve_content_mange.jsp");
	}
	public void reserve_join_mange_delete(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String id=request.getParameter("reserveid");
		
		String sql="delete from reservejoin where reserveid=?";
	
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("reserve_join_content_mange.jsp");
	}
	public void reserve_state_change(HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		String id=request.getParameter("id");
		int state=Integer.parseInt(request.getParameter("state"));
		
		if(state==0)
		{
			String sql="update reserve set state=1 where id=?";
			
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
			response.sendRedirect("reserve_content_mange.jsp");
		}
		else if(state==1)
		{
			String sql2="update reserve set state=0 where id=?";
			
			PreparedStatement pstmt=conn.prepareStatement(sql2);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
			response.sendRedirect("reserve_content_mange.jsp");
		}
	}
		public void reserve_join_state_change(HttpServletRequest request,HttpServletResponse response) throws Exception
		{
			String id=request.getParameter("reserveid");
			int state=Integer.parseInt(request.getParameter("state"));
			
			if(state==0)
			{
				String sql="update reservejoin set state=1 where reserveid=?";
				
				PreparedStatement pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				pstmt.executeUpdate();
				
				pstmt.close();
				conn.close();
				
				response.sendRedirect("reserve_join_content_mange.jsp");
			}
			else if(state==1)
			{
				String sql2="update reservejoin set state=0 where reserveid=?";
				
				PreparedStatement pstmt=conn.prepareStatement(sql2);
				pstmt.setString(1, id);
				
				pstmt.executeUpdate();
				
				pstmt.close();
				conn.close();
				
				response.sendRedirect("reserve_join_content_mange.jsp");
			}
		}			
}
