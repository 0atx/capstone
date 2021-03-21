package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import model.Course;

@Repository
public class PlaceDao {
	
private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public int getRowCount() {
		String sqlStatement = "select count(*) from places";
		return jdbcTemplate.queryForObject(sqlStatement, Integer.class);
	}
	
	//query and return a single object
	public Course getPlace(String title) {
		String sqlStatement = "select * from places where title=?";
		return jdbcTemplate.queryForObject(sqlStatement, new Object[] {title}, 
				new RowMapper<Place>() {

			@Override
			public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Place place = new Place();
				
				place.setAddr(rs.getString("addr"));
				place.setImage(rs.getString("image"));
				place.setMapx(rs.getDouble("mapx"));
				place.setMapy(rs.getDouble("mapy"));
				place.setCat(rs.getString("cat"));
				place.setTitle(rs.getString("title"));
				place.setCount(rs.getInt("count"));
			
				return place;
			}
			
		});
	}
	
		//query and return a multiple object
		//cRud method
		public List<Place> getPlaces() {
			String sqlStatement = "select * from places";
			return jdbcTemplate.query(sqlStatement, new RowMapper<Place>() {

				@Override
				public Place mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					Place place = new Place();
					
					place.setAddr(rs.getString("addr"));
					place.setImage(rs.getString("image"));
					place.setMapx(rs.getDouble("mapx"));
					place.setMapy(rs.getDouble("mapy"));
					place.setCat(rs.getString("cat"));
					place.setTitle(rs.getString("title"));
					place.setCount(rs.getInt("count"));
					
					return place;
				}
				
			});
		}
		
		//Crud method
		public boolean insert(Place place) {
			
			place.setAddr(rs.getString("addr"));
			place.setImage(rs.getString("image"));
			place.setMapx(rs.getDouble("mapx"));
			place.setMapy(rs.getDouble("mapy"));
			place.setCat(rs.getString("cat"));
			place.setTitle(rs.getString("title"));
			place.setCount(rs.getInt("count"));
			
			String addr = place.getAddr();
			String image = place.getImage();
			double mapx = place.getMapx();
			double mapy = place.getMapy();
			String cat = place.getCat();
			String title = place.getTitle();
			int count = place.getCount(); 
			
			String sqlStatement = "insert into places (title, addr, image, mapx, mapy, cat) values(?, ?, ?, ?, ?, ?)";
			
			return (jdbcTemplate.update(sqlStatement, new Object[] {title, addr, image, mapx, mapy, cat}) == 1);
			
		}
		
		//crUd method
		public boolean update(Place place) {
					
			String addr = place.getAddr();
			String image = place.getImage();
			double mapx = place.getMapx();
			double mapy = place.getMapy();
			String cat = place.getCat();
			String title = place.getTitle();
			int count = place.getCount(); 
				
			String sqlStatement = "update places set addr = ?, image = ?, mapx = ?, mapy = ?, cat = ? where title = ?";
				
			return (jdbcTemplate.update(sqlStatement, new Object[] {title, addr, image, mapx, mapy, cat}) == 1);
					
		}
		
		//cruD method 일정 DB에서 삭제할때 장소 검색한 다음에 중복되면 삭제 안하고 중복 안되면 삭제
		public boolean delete(String title) {
			
			String sqlStatement = "delete from places where title = ?";
						
			return (jdbcTemplate.update(sqlStatement, new Object[] {title}) == 1);
							
		}

}
