package project.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import project.dto.JejuCafeDto;

public class JejuCafeDao {
	Connection conn;
	public JejuCafeDao() throws Exception	{
		Class.forName("com.mysql.jdbc.Driver");
		String db="jdbc:mysql://localhost:3306/project";
		conn=DriverManager.getConnection(db,"root","tlsalstjq78");
	}
	public ArrayList<JejuCafeDto> jeju_list(HttpServletRequest request,int index) throws Exception	{
		request.setCharacterEncoding("utf-8");
		String menu = request.getParameter("menu");
		ArrayList<JejuCafeDto> jlist = new ArrayList<>();
		
		if (menu.equals("place"))	{
			String sql = "select * from place order by id limit ?,12";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())	{
				JejuCafeDto jdto = new JejuCafeDto();
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
		if (menu.equals("cafe"))	{
			String sql = "select * from cafe order by id limit ?,12";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())	{
				JejuCafeDto jdto = new JejuCafeDto();
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
		if (menu.equals("food"))	{
			String sql = "select * from food order by id limit ?,12";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())	{
				JejuCafeDto jdto = new JejuCafeDto();
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
		if (menu.equals("activity"))	{
			String sql = "select * from activity order by id limit ?,12";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())	{
				JejuCafeDto jdto = new JejuCafeDto();
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
	public JejuCafeDto jeju_cafe_content(HttpServletRequest request) throws Exception	{
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String sql = "select * from cafe where id=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		JejuCafeDto jdto = new JejuCafeDto();
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
	public ArrayList<JejuCafeDto> jeju_cafe_photo(HttpServletRequest request) throws Exception	{
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String sql = "select cafephoto.* from cafe,cafephoto where cafe.title = cafephoto.cafetitle and cafe.id=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		ArrayList<JejuCafeDto> jclist = new ArrayList<>();
		while (rs.next())	{
			JejuCafeDto jdto = new JejuCafeDto();
			jdto.setId(rs.getInt("id"));
			jdto.setTitle(rs.getString("cafetitle"));
			jdto.setPhoto(rs.getString("photo"));
			
			jclist.add(jdto);
		}
		return jclist;
	}
	public int jeju_list_count(HttpServletRequest request) throws Exception	{
		String menu = request.getParameter("menu");
		int cnt = 0;
		
		if(menu.equals("cafe"))		{
			String sql="select count(*) as cnt from cafe";	
		    PreparedStatement pstmt = conn.prepareStatement(sql);
		    
		    ResultSet rs=pstmt.executeQuery();
		    rs.next();
		    cnt=rs.getInt("cnt");
		}
		if(menu.equals("place"))		{
			String sql="select count(*) as cnt from place";
		    PreparedStatement pstmt = conn.prepareStatement(sql);
		    
		    ResultSet rs=pstmt.executeQuery();
		    rs.next();
		    cnt=rs.getInt("cnt");
		}
		if(menu.equals("food"))		{
			String sql="select count(*) as cnt from food";
		    PreparedStatement pstmt = conn.prepareStatement(sql);
		    
		    ResultSet rs=pstmt.executeQuery();
		    rs.next();
		    cnt=rs.getInt("cnt");
		}
		if(menu.equals("activity"))		{
			String sql="select count(*) as cnt from activity";
		    PreparedStatement pstmt = conn.prepareStatement(sql);
		    
		    ResultSet rs=pstmt.executeQuery();
		    rs.next();
		    cnt=rs.getInt("cnt");
		}
	    
	    return cnt;
	}
	public ArrayList<JejuCafeDto> jejucafe_search(HttpServletRequest request,int index) throws Exception {
		request.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");
		String searchmenu = request.getParameter("searchmenu");
		String searchname = "%"+search+"%";
		ArrayList<JejuCafeDto> jlist = new ArrayList<>();
	
		if(searchmenu.equals("title"))	{
			String sql = "select * from cafe where title like ? order by id limit ?,6";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchname);
			pstmt.setInt(2,index);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next())	{
				JejuCafeDto jdto = new JejuCafeDto();
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
			String sql = "select * from cafe where addr like ? order by id limit ?,6";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchname);
			pstmt.setInt(2, index);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())	{
				JejuCafeDto jdto = new JejuCafeDto();
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
	public int jeju_cafe_search_cnt(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");
		String searchmenu = request.getParameter("searchmenu");
		String searchname = "%"+search+"%";
		int cnt = 0 ;
		
		if(searchmenu.equals("title"))	{
			String sql = "select count(*) as cnt from cafe where title like ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchname);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			cnt=rs.getInt("cnt");
		}
		
		if(searchmenu.equals("addr"))	{
			String sql = "select count(*) as cnt from cafe where addr like ? ";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchname);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			cnt=rs.getInt("cnt");
		}
		return cnt;
	}	
	public ArrayList<JejuCafeDto> jeju_map(HttpServletRequest request) throws Exception	{
		request.setCharacterEncoding("utf-8");
		String menu = request.getParameter("menu");
		String region = request.getParameter("region");
		ArrayList<JejuCafeDto> jlist = new ArrayList<>();
		
		if (menu.equals("cafe"))	{
			if (region.equals("?????????"))	{
				String regionname1 = "%"+region+" ??????%";
				String regionname2 = "%"+region+" ??????%";
				String regionname3 = "%"+region+" ??????%";
				String regionname4 = "%"+region+" ??????%";
				String regionname5 = "%"+region+" ??????%";
				String regionname6 = "%"+region+" ??????%";
				String regionname7 = "%"+region+" ??????%";
				String regionname8 = "%"+region+" ??????%";
				String regionname9 = "%"+region+" ??????%";
				String regionname10 = "%"+region+" ??????%";
				String regionname11 = "%"+region+" ??????%";
				String regionname12 = "%"+region+" ??????%";
				String regionname13 = "%"+region+" ??????%";
				String regionname14 = "%"+region+" ??????%";
				String regionname15 = "%"+region+" ??????%";
				
				String sql = "select * from cafe where addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ?";
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, regionname1);
				pstmt.setString(2, regionname2);
				pstmt.setString(3, regionname3);
				pstmt.setString(4, regionname4);
				pstmt.setString(5, regionname5);
				pstmt.setString(6, regionname6);
				pstmt.setString(7, regionname7);
				pstmt.setString(8, regionname8);
				pstmt.setString(9, regionname9);
				pstmt.setString(10, regionname10);
				pstmt.setString(11, regionname11);
				pstmt.setString(12, regionname12);
				pstmt.setString(13, regionname13);
				pstmt.setString(14, regionname14);
				pstmt.setString(15, regionname15);
				
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next())	{
					JejuCafeDto jdto = new JejuCafeDto();
					jdto.setId(rs.getInt("id"));
					jdto.setTitle(rs.getString("title"));
					jdto.setAddr(rs.getString("addr"));
					
					jlist.add(jdto);
				}
			}
			else if (region.equals("????????????"))	{
				String regionname1 = "%"+region+" ??????%";
				String regionname2 = "%"+region+" ??????%";
				String regionname3 = "%"+region+" ??????%";
				String regionname4 = "%"+region+" ??????%";
				String regionname5 = "%"+region+" ??????%";
				String regionname6 = "%"+region+" ??????%";
				String regionname7 = "%"+region+" ??????%";
				String regionname8 = "%"+region+" ??????%";
				String regionname9 = "%"+region+" ??????%";
				String regionname10 = "%"+region+" ??????%";
				String regionname11 = "%"+region+" ??????%";
					
				String sql = "select * from cafe where addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, regionname1);
				pstmt.setString(2, regionname2);
				pstmt.setString(3, regionname3);
				pstmt.setString(4, regionname4);
				pstmt.setString(5, regionname5);
				pstmt.setString(6, regionname6);
				pstmt.setString(7, regionname7);
				pstmt.setString(8, regionname8);
				pstmt.setString(9, regionname9);
				pstmt.setString(10, regionname10);
				pstmt.setString(11, regionname11);
				
				ResultSet rs = pstmt.executeQuery();
					
				while (rs.next())	{
					JejuCafeDto jdto = new JejuCafeDto();
					jdto.setId(rs.getInt("id"));
					jdto.setTitle(rs.getString("title"));
					jdto.setAddr(rs.getString("addr"));
						
					jlist.add(jdto);
				}
			}
			else	{
				String regionname =  "%"+region+"%";
				String sql = "select * from cafe where addr like ?";
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, regionname);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next())	{
					JejuCafeDto jdto = new JejuCafeDto();
					jdto.setId(rs.getInt("id"));
					jdto.setTitle(rs.getString("title"));
					jdto.setAddr(rs.getString("addr"));
					
					jlist.add(jdto);
				
				}
			}
		}
		else if (menu.equals("food"))	{
			if (region.equals("?????????"))	{
				String regionname1 = "%"+region+" ??????%";
				String regionname2 = "%"+region+" ??????%";
				String regionname3 = "%"+region+" ??????%";
				String regionname4 = "%"+region+" ??????%";
				String regionname5 = "%"+region+" ??????%";
				String regionname6 = "%"+region+" ??????%";
				String regionname7 = "%"+region+" ??????%";
				String regionname8 = "%"+region+" ??????%";
				String regionname9 = "%"+region+" ??????%";
				String regionname10 = "%"+region+" ??????%";
				String regionname11 = "%"+region+" ??????%";
				String regionname12 = "%"+region+" ??????%";
				String regionname13 = "%"+region+" ??????%";
				String regionname14 = "%"+region+" ??????%";
				String regionname15 = "%"+region+" ??????%";
				
				String sql = "select * from food where addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ?";
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, regionname1);
				pstmt.setString(2, regionname2);
				pstmt.setString(3, regionname3);
				pstmt.setString(4, regionname4);
				pstmt.setString(5, regionname5);
				pstmt.setString(6, regionname6);
				pstmt.setString(7, regionname7);
				pstmt.setString(8, regionname8);
				pstmt.setString(9, regionname9);
				pstmt.setString(10, regionname10);
				pstmt.setString(11, regionname11);
				pstmt.setString(12, regionname12);
				pstmt.setString(13, regionname13);
				pstmt.setString(14, regionname14);
				pstmt.setString(15, regionname15);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next())	{
					JejuCafeDto jdto = new JejuCafeDto();
					jdto.setId(rs.getInt("id"));
					jdto.setTitle(rs.getString("title"));
					jdto.setAddr(rs.getString("addr"));
					
					jlist.add(jdto);
				}
			}
			else if (region.equals("????????????"))	{
				String regionname1 = "%"+region+" ??????%";
				String regionname2 = "%"+region+" ??????%";
				String regionname3 = "%"+region+" ??????%";
				String regionname4 = "%"+region+" ??????%";
				String regionname5 = "%"+region+" ??????%";
				String regionname6 = "%"+region+" ??????%";
				String regionname7 = "%"+region+" ??????%";
				String regionname8 = "%"+region+" ??????%";
				String regionname9 = "%"+region+" ??????%";
				String regionname10 = "%"+region+" ??????%";
				String regionname11 = "%"+region+" ??????%";
					
				String sql = "select * from food where addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, regionname1);
				pstmt.setString(2, regionname2);
				pstmt.setString(3, regionname3);
				pstmt.setString(4, regionname4);
				pstmt.setString(5, regionname5);
				pstmt.setString(6, regionname6);
				pstmt.setString(7, regionname7);
				pstmt.setString(8, regionname8);
				pstmt.setString(9, regionname9);
				pstmt.setString(10, regionname10);
				pstmt.setString(11, regionname11);
				
				ResultSet rs = pstmt.executeQuery();
					
				while (rs.next())	{
					JejuCafeDto jdto = new JejuCafeDto();
					jdto.setId(rs.getInt("id"));
					jdto.setTitle(rs.getString("title"));
					jdto.setAddr(rs.getString("addr"));
						
					jlist.add(jdto);
				}
			}
			else	{
				String regionname =  "%"+region+"%";
				String sql = "select * from food where addr like ?";
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, regionname);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next())	{
					JejuCafeDto jdto = new JejuCafeDto();
					jdto.setId(rs.getInt("id"));
					jdto.setTitle(rs.getString("title"));
					jdto.setAddr(rs.getString("addr"));
					
					jlist.add(jdto);
				
				}
			}
		}
		else if (menu.equals("place"))	{
			if (region.equals("?????????"))	{
				String regionname1 = "%"+region+" ??????%";
				String regionname2 = "%"+region+" ??????%";
				String regionname3 = "%"+region+" ??????%";
				String regionname4 = "%"+region+" ??????%";
				String regionname5 = "%"+region+" ??????%";
				String regionname6 = "%"+region+" ??????%";
				String regionname7 = "%"+region+" ??????%";
				String regionname8 = "%"+region+" ??????%";
				String regionname9 = "%"+region+" ??????%";
				String regionname10 = "%"+region+" ??????%";
				String regionname11 = "%"+region+" ??????%";
				String regionname12 = "%"+region+" ??????%";
				String regionname13 = "%"+region+" ??????%";
				String regionname14 = "%"+region+" ??????%";
				String regionname15 = "%"+region+" ??????%";
				
				String sql = "select * from place where addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ?";
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, regionname1);
				pstmt.setString(2, regionname2);
				pstmt.setString(3, regionname3);
				pstmt.setString(4, regionname4);
				pstmt.setString(5, regionname5);
				pstmt.setString(6, regionname6);
				pstmt.setString(7, regionname7);
				pstmt.setString(8, regionname8);
				pstmt.setString(9, regionname9);
				pstmt.setString(10, regionname10);
				pstmt.setString(11, regionname11);
				pstmt.setString(12, regionname12);
				pstmt.setString(13, regionname13);
				pstmt.setString(14, regionname14);
				pstmt.setString(15, regionname15);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next())	{
					JejuCafeDto jdto = new JejuCafeDto();
					jdto.setId(rs.getInt("id"));
					jdto.setTitle(rs.getString("title"));
					jdto.setAddr(rs.getString("addr"));
					
					jlist.add(jdto);
				}
			}
			else if (region.equals("????????????"))	{
				String regionname1 = "%"+region+" ??????%";
				String regionname2 = "%"+region+" ??????%";
				String regionname3 = "%"+region+" ??????%";
				String regionname4 = "%"+region+" ??????%";
				String regionname5 = "%"+region+" ??????%";
				String regionname6 = "%"+region+" ??????%";
				String regionname7 = "%"+region+" ??????%";
				String regionname8 = "%"+region+" ??????%";
				String regionname9 = "%"+region+" ??????%";
				String regionname10 = "%"+region+" ??????%";
				String regionname11 = "%"+region+" ??????%";
					
				String sql = "select * from place where addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, regionname1);
				pstmt.setString(2, regionname2);
				pstmt.setString(3, regionname3);
				pstmt.setString(4, regionname4);
				pstmt.setString(5, regionname5);
				pstmt.setString(6, regionname6);
				pstmt.setString(7, regionname7);
				pstmt.setString(8, regionname8);
				pstmt.setString(9, regionname9);
				pstmt.setString(10, regionname10);
				pstmt.setString(11, regionname11);
				
				ResultSet rs = pstmt.executeQuery();
					
				while (rs.next())	{
					JejuCafeDto jdto = new JejuCafeDto();
					jdto.setId(rs.getInt("id"));
					jdto.setTitle(rs.getString("title"));
					jdto.setAddr(rs.getString("addr"));
						
					jlist.add(jdto);
				}
			}
			else	{
				String regionname =  "%"+region+"%";
				String sql = "select * from place where addr like ?";
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, regionname);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next())	{
					JejuCafeDto jdto = new JejuCafeDto();
					jdto.setId(rs.getInt("id"));
					jdto.setTitle(rs.getString("title"));
					jdto.setAddr(rs.getString("addr"));
					
					jlist.add(jdto);
				
				}
			}
		}
		else if (menu.equals("activity"))	{
			if (region.equals("?????????"))	{
				String regionname1 = "%"+region+" ??????%";
				String regionname2 = "%"+region+" ??????%";
				String regionname3 = "%"+region+" ??????%";
				String regionname4 = "%"+region+" ??????%";
				String regionname5 = "%"+region+" ??????%";
				String regionname6 = "%"+region+" ??????%";
				String regionname7 = "%"+region+" ??????%";
				String regionname8 = "%"+region+" ??????%";
				String regionname9 = "%"+region+" ??????%";
				String regionname10 = "%"+region+" ??????%";
				String regionname11 = "%"+region+" ??????%";
				String regionname12 = "%"+region+" ??????%";
				String regionname13 = "%"+region+" ??????%";
				String regionname14 = "%"+region+" ??????%";
				String regionname15 = "%"+region+" ??????%";
				
				String sql = "select * from activity where addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ?";
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, regionname1);
				pstmt.setString(2, regionname2);
				pstmt.setString(3, regionname3);
				pstmt.setString(4, regionname4);
				pstmt.setString(5, regionname5);
				pstmt.setString(6, regionname6);
				pstmt.setString(7, regionname7);
				pstmt.setString(8, regionname8);
				pstmt.setString(9, regionname9);
				pstmt.setString(10, regionname10);
				pstmt.setString(11, regionname11);
				pstmt.setString(12, regionname12);
				pstmt.setString(13, regionname13);
				pstmt.setString(14, regionname14);
				pstmt.setString(15, regionname15);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next())	{
					JejuCafeDto jdto = new JejuCafeDto();
					jdto.setId(rs.getInt("id"));
					jdto.setTitle(rs.getString("title"));
					jdto.setAddr(rs.getString("addr"));
					
					jlist.add(jdto);
				}
			}
			else if (region.equals("????????????"))	{
				String regionname1 = "%"+region+" ??????%";
				String regionname2 = "%"+region+" ??????%";
				String regionname3 = "%"+region+" ??????%";
				String regionname4 = "%"+region+" ??????%";
				String regionname5 = "%"+region+" ??????%";
				String regionname6 = "%"+region+" ??????%";
				String regionname7 = "%"+region+" ??????%";
				String regionname8 = "%"+region+" ??????%";
				String regionname9 = "%"+region+" ??????%";
				String regionname10 = "%"+region+" ??????%";
				String regionname11 = "%"+region+" ??????%";
					
				String sql = "select * from activity where addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ? or addr like ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, regionname1);
				pstmt.setString(2, regionname2);
				pstmt.setString(3, regionname3);
				pstmt.setString(4, regionname4);
				pstmt.setString(5, regionname5);
				pstmt.setString(6, regionname6);
				pstmt.setString(7, regionname7);
				pstmt.setString(8, regionname8);
				pstmt.setString(9, regionname9);
				pstmt.setString(10, regionname10);
				pstmt.setString(11, regionname11);
				
				ResultSet rs = pstmt.executeQuery();
					
				while (rs.next())	{
					JejuCafeDto jdto = new JejuCafeDto();
					jdto.setId(rs.getInt("id"));
					jdto.setTitle(rs.getString("title"));
					jdto.setAddr(rs.getString("addr"));
						
					jlist.add(jdto);
				}
			}
			else	{
				String regionname =  "%"+region+"%";
				String sql = "select * from activity where addr like ?";
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, regionname);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next())	{
					JejuCafeDto jdto = new JejuCafeDto();
					jdto.setId(rs.getInt("id"));
					jdto.setTitle(rs.getString("title"));
					jdto.setAddr(rs.getString("addr"));
					
					jlist.add(jdto);
				
				}
			}
		}
		return jlist;
	}
}
	
	
	