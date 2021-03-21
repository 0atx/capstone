package kr.ac.hansung.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Place {

	private String title;
	
	private String addr;
	
	private String image;
	
	private double mapx;
	
	private double mapy;
	
	private String cat;
	
	private Integer count;

}