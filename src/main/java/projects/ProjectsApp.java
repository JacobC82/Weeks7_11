package projects;

import java.sql.Connection;

import projects.dao.DBConnection;

public class ProjectsApp {

	public static void main(String[] args) {
		
		@SuppressWarnings("unused")
		Connection conn = DBConnection.getConnection();
	}

}
