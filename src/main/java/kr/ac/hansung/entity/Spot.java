package kr.ac.hansung.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString 

@Entity
@Table(name="spot_table")
public class Spot {
   @Id
   @Column(name="spot_id")
   private String id;
   
   @Column(name= "title", nullable = false)
   private String title; //장소이름

   @Column(name = "addr", nullable= false)
   private String addr; //주소

   @Column
   private String image; //이미지

   @Column
   private double mapx; //x좌표

   @Column
   private double mapy; //y좌표

   @Column
   private String cat; //카테고리
   
	/*
	 * @ManyToOne(targetEntity=Plan.class, fetch=FetchType.LAZY)
	 * 
	 * @JoinColumn(name="plan_id") private Plan plan;
	 */

   @ManyToMany(fetch = FetchType.EAGER)
   @JoinTable(name = "plan_spot", joinColumns = @JoinColumn(name = "spot_id"), inverseJoinColumns = @JoinColumn(name = "plan_id"))
   @JsonIgnore
   private Set<Plan> plans;


}