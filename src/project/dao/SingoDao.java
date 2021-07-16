package project.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


import project.dto.SingoDto;

public class SingoDao {

	Connection conn;
	public SingoDao() throws Exception
	{
		//DB연결
		Class.forName("com.mysql.jdbc.Driver");
		String db="jdbc:mysql://localhost/project";
		conn=DriverManager.getConnection(db,"root","tlsalstjq78");
	}
	public ArrayList<SingoDto> slist() throws Exception
	{
		String sql="select * from singo order by id desc";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		
		ArrayList<SingoDto> slist=new ArrayList<SingoDto>();
		while(rs.next())
		{
			SingoDto sdto=new SingoDto();
			sdto.setId(rs.getInt("id"));
			sdto.setBaduser(rs.getString("baduser"));
			sdto.setSname(rs.getString("sname"));
			sdto.setScontent(rs.getString("scontent"));
			sdto.setState(rs.getInt("state"));
			
			slist.add(sdto);
		}
		
		return slist;
	}
}
