package kr.ac.hansung.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

@Entity
@Table(name="plan_table")
public class Plan {
   @Id
   @GeneratedValue(strategy = GenerationType.AUTO)
   @Column(name="plan_id")
   private Long id;
   
   @Column
   private String StartDate;

   @Column
   private String EndDate;
   
   @Column
   private String PlanDay;
   
   @Column
   private String ToTalDate;
   
}