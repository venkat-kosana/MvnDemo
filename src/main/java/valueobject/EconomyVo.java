package valueobject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Economy;
public class EconomyVo {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xepdb1", "hr", "hr");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}

	public static int save(Economy e,int upiid) {
		int status = 0;
		try {
			Connection con = EconomyVo.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into economy(type,amount,upiid) values (?,?,?)");
			ps.setString(1, e.getType());
			ps.setInt(2, e.getAmt());
			ps.setInt(3, upiid);
			status = ps.executeUpdate();

			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static List<Economy> getAllRecords(String type,int upiid) {
		List<Economy> list = new ArrayList<Economy>();

		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from economy where type=? and upiid=? order by transactiontime desc");
			ps.setString(1, type);
			ps.setInt(2, upiid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Economy u = new Economy();
				u.setType(rs.getString("type"));
				u.setAmt(rs.getInt("amount"));
				u.setDateString(rs.getString("transactiontime"));

				list.add(u);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	public static List<Economy> getAllUsers()
	{
		List<Economy> list = new ArrayList<Economy>();

		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from economyuser");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Economy u = new Economy();
				u.setUpiid(rs.getInt("upiid"));
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setDateString(rs.getString("createdat"));
				list.add(u);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public static int saveinc(int netval, String type,int upiid) {
		int status = 0;
		int befbal = 0;
		try {
			Connection con = getConnection();
			if (type.equals("income")) {
				PreparedStatement ps1 = con.prepareStatement("select * from economyinc where upiid=? order by updatedtime desc");
				ps1.setInt(1, upiid);
				ResultSet rs = ps1.executeQuery();
				if(rs.next())
				{
					befbal = rs.getInt(1);
				}
				if(befbal != netval)
				{
					PreparedStatement ps = con.prepareStatement("insert into economyinc(income,upiid) values (?,?)");
					ps.setInt(1, netval);
					ps.setInt(2, upiid);				
					status = ps.executeUpdate();	
				}
				
			} else {
				PreparedStatement ps1 = con.prepareStatement("select * from economyexp where upiid=? order by updatedtime desc");
				ps1.setInt(1, upiid);
				ResultSet rs = ps1.executeQuery();
				if(rs.next())
				{
					befbal = rs.getInt(1);
				}
				if(befbal != netval)
				{
					PreparedStatement ps = con.prepareStatement("insert into economyexp(expenditure,upiid) values (?,?)");
					ps.setInt(1, netval);
					ps.setInt(2, upiid);				
					status = ps.executeUpdate();	
				}
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int deleteUser(int upiid,int idadmin) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps3 = con.prepareStatement("delete from economy where upiid=?");
			ps3.setInt(1, upiid);
			status =status + ps3.executeUpdate();
			PreparedStatement ps = con.prepareStatement("delete from economyuser where upiid=?");
			ps.setInt(1, upiid);
			status =status + ps.executeUpdate();
			PreparedStatement ps1 = con.prepareStatement("delete from economyinc where upiid=?");
			ps1.setInt(1, upiid);
			status =status + ps1.executeUpdate();
			PreparedStatement ps2 = con.prepareStatement("delete from economyexp where upiid=?");
			ps2.setInt(1, upiid);
			status =status + ps2.executeUpdate();
			PreparedStatement ps4 = con.prepareStatement("delete from networth where upiid=?");
			ps4.setInt(1, upiid);
			status =status + ps4.executeUpdate();
			PreparedStatement ps5 = con.prepareStatement("insert into economyadminlog(adminid,userupiid) values(?,?)");
			ps5.setInt(1, idadmin);
			ps5.setInt(2, upiid);
			status =status + ps5.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int[] getValues(int upiid) {
		int[] a = new int[2];
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from economyinc where upiid=? order by updatedtime desc");
			ps.setInt(1, upiid);
			ResultSet rs = ps.executeQuery();
			PreparedStatement ps1 = con.prepareStatement("select * from economyexp where upiid=? order by updatedtime desc");
			ps1.setInt(1, upiid);
			ResultSet rs1 = ps1.executeQuery();
			if(rs.next())
			{
				a[0] = rs.getInt(1);
			}
			if(rs1.next())
			{
				a[1] = rs1.getInt(1);
			}
			

		} catch (Exception e) {
			System.out.println(e);
		}
		return a;
	}
	public static int userSave(Economy e)
	{
		int status = 0;
		try {
			Connection con = EconomyVo.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into economyuser(upiid,name,password) values (?,?,?)");
			ps.setInt(1, e.getUpiid());
			ps.setString(2, e.getName());
			ps.setString(3, e.getPassword());
			status = ps.executeUpdate();

			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}
	public static int validate(int upiid, String password, String usertype)
	{
		int a;
		String b;
		try {
			Connection con = getConnection();
			ResultSet rs;
			if(usertype.equals("admin"))
			{
				PreparedStatement ps = con.prepareStatement("select * from admin where id=?");
				ps.setInt(1, upiid);
				rs = ps.executeQuery();
			}
			else {
				PreparedStatement ps = con.prepareStatement("select * from economyuser where upiid=?");
				ps.setInt(1, upiid);
				rs = ps.executeQuery();
			}
			
			if(rs.next())
			{
				a = rs.getInt(1);
				b = rs.getString(3); 
			}
			else {
				return 0;
			}
			if (a == upiid && b.equals(password)) {
				return 1;
				
			}
			else {
				return 0;
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return  1;
	}
	public static void netSave(int upiid, int net)
	{
		int befbal = 0;
		try {
			Connection con = EconomyVo.getConnection();
			PreparedStatement ps1 = con.prepareStatement("select * from networth where upiid=? order by updatedat desc");
			ps1.setInt(1, upiid);
			ResultSet rs = ps1.executeQuery();
			if(rs.next())
			{
				befbal = rs.getInt(1);
			}
			if(befbal != net)
			{
				PreparedStatement ps = con.prepareStatement("insert into networth(networth,upiid) values (?,?)");
				ps.setInt(1, net);
				ps.setInt(2, upiid);				
				ps.executeUpdate();	
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
	

}
