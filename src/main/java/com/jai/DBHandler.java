   package com.jai;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBHandler {
    String errormessage;
	
public	ArrayList<User> getUser(String name)
		{   errormessage="";
		
			ArrayList<User> users=new ArrayList<>();
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/myfacebook?user=root&password=root");
				String query="select * from user where name like '"+name+"%'";
				PreparedStatement st=cn.prepareStatement(query);
				ResultSet rs=st.executeQuery();
				while(rs.next())
				{
					User u=new User(rs.getString(1),rs.getString(3));
					users.add(u);
					
				}
				cn.close();
				
			}
			catch(Exception e)
			{
				errormessage=e.getMessage();
			}
			
			return users;
		}

 public  void sendRequest(String receiver,String sender)
  {
	  errormessage="";
	  try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/myfacebook?user=root&password=root");
			String query="insert into friends(sender,rec,status,dor) values(?,?,?,?)";
			PreparedStatement st=cn.prepareStatement(query);
			st.setString(1,sender);
			st.setString(2, receiver);
			st.setInt(3, 0);
			st.setString(4, new java.util.Date().toString());
			st.executeUpdate();
			cn.close();
			
		}
		catch(Exception e)
		{
			errormessage=e.getMessage();
		}
	
  }
 
 public void acceptRequest(int fid) 
 {  
	 errormessage="";
	 try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/myfacebook?user=root&password=root");
			String query="update friends set status=1 where fid=?";
			PreparedStatement st=cn.prepareStatement(query);
			st.setInt(1, fid);
			st.executeUpdate();
			cn.close();
			
		}
		catch(Exception e)
		{
			errormessage=e.getMessage();
		}

	 
 }
  
public String getName(String email)
 {      
	 String name="";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/myfacebook?user=root&password=root");
			String query="select name from user where emailid=?";
			PreparedStatement st=cn.prepareStatement(query);
			st.setString(1, email);
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				 name=rs.getString(1);
			}
			cn.close();
			
		}
		catch(Exception e)
		{
			errormessage=e.getMessage();
		}
		return name;
 }
 
 public  ArrayList<User> getRequest(String currentuser)
 {
	  errormessage="";
	  ArrayList<User> users=new ArrayList<>();
	  try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/myfacebook?user=root&password=root");
			String query="select fid,sender from friends where rec=? and status=0 order by fid desc";
			PreparedStatement st=cn.prepareStatement(query);
			st.setString(1,currentuser);
			
			ResultSet rs=st.executeQuery();
			while(rs.next())
			{
				String email=rs.getString(1)+":"+rs.getString(2);
				String name=getName(email.split(":")[1]);
				User u= new User(email,name);
				users.add(u);
			}
			cn.close();
			
		}
		catch(Exception e)
		{
			errormessage=e.getMessage();
		}
	return users;
 }

 
	
public	ArrayList<User> getFriends(String currentuser)
		{   errormessage="";
		
			ArrayList<User> users=new ArrayList<>();
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/myfacebook?user=root&password=root");
				String query="select sender,rec from friends where (sender=? or rec=?) and status=1 ";
				PreparedStatement st=cn.prepareStatement(query);
				st.setString(1, currentuser);
				st.setString(2, currentuser);
				
				ResultSet rs=st.executeQuery();
				while(rs.next())
				{
					String sender=rs.getString(1);
					String receiver=rs.getString(2);
					if(sender.equals(currentuser))
					{
						String email=receiver;
						String name=getName(email);
						User u=new User(email,name);
						users.add(u);
					}
					else
					{
						String email=sender;
						String name=getName(email);
						User u=new User(email,name);
						users.add(u);
					}
				 	
				}
				cn.close();
				
			}
			catch(Exception e)
			{
				errormessage=e.getMessage();
			}
			
			return users;
		}

ArrayList<String> getMyFriends(String currentuser)
{
	ArrayList<String> myfriends=new ArrayList<>();
	ArrayList<User> friends=getFriends(currentuser);
	for(User u:friends)
	{
		myfriends.add(u.getEmail());
		
	}
	return myfriends;
	
}


public ArrayList<Wpost> getPosts(String currentuser)
{
	ArrayList<Wpost> post=new ArrayList<>();
	  try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/myfacebook?user=root&password=root");
			String query="select * from wpost order by wid desc";
			PreparedStatement st=cn.prepareStatement(query);			
			ResultSet rs=st.executeQuery();
			ArrayList<String> myfriends=getMyFriends(currentuser);
			myfriends.add(currentuser);
			 
			while(rs.next())
			{
				Wpost wp=new Wpost(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getBlob(5));
				if(myfriends.contains(wp.getSender()))
				{
					post.add(wp);
				}
			}
			
			
			cn.close();
		
		}
		catch(Exception e)
		{
			errormessage=e.getMessage();
		}
		return post;
	
}
public  void savePost(String sender,String post)
{
	  errormessage="";
	  try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/myfacebook?user=root&password=root");
			String query="insert into wpost(sender,post,dop) values(?,?,?)";
			PreparedStatement st=cn.prepareStatement(query);
			st.setString(1,sender);
			st.setString(2, post);
			st.setString(3, new java.util.Date().toString());
			st.executeUpdate();
			cn.close();
			
		}
		catch(Exception e)
		{
			errormessage=e.getMessage();
		}
	
}

public  void savePost(String sender,String post,Blob img)
{
	  errormessage="";
	  try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/myfacebook?user=root&password=root");
			String query="insert into wpost(sender,post,dop,image) values(?,?,?,?)";
			PreparedStatement st=cn.prepareStatement(query);
			st.setString(1,sender);
			st.setString(2, post);
			st.setString(3, new java.util.Date().toString());
			st.setBlob(4, img);
			st.executeUpdate();
			cn.close();
			
		}
		catch(Exception e)
		{
			errormessage=e.getMessage();
		}
	
}


public	User getprofile(String email)
{   errormessage="";

    User u=new User();
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/myfacebook?user=root&password=root");
		String query="select * from user where emailid=?";
		PreparedStatement st=cn.prepareStatement(query);
		st.setString(1, email);
		ResultSet rs=st.executeQuery();
		if(rs.next())
		{
			u=new User(rs.getString(1),rs.getString(3));
			
			
		}
		cn.close();
		
	}
	catch(Exception e)
	{
		errormessage=e.getMessage();
	}
	
	return u;
}
 
  String getErrorMessage()
  {
	  return errormessage;
  }
}
