package kr.ac.hansung.entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter

@Entity
@Table(name="plan_table")
public class Plan {
   @Id
   @Column(name="plan_id")
   private String id;
   
   @Column
   private String StartDate;

   @Column
   private String EndDate;
   
   @Column
   private String PlanDay; //n일차
   
   @Column
   private String ToTalDate;
   
   @ManyToMany(fetch = FetchType.EAGER)
   @JoinTable(name = "user_plan", joinColumns = @JoinColumn(name = "plan_id"), inverseJoinColumns = @JoinColumn(name = "email"))
   @JsonIgnore
   private Set<User> users;
   
   @ManyToMany(fetch = FetchType.EAGER)
   @JoinTable(name="plan_spot", joinColumns= @JoinColumn(name="plan_id"), 
               inverseJoinColumns= @JoinColumn(name="spot_id"))
   private List<Spot> spots = new ArrayList<Spot>();
   
   
}