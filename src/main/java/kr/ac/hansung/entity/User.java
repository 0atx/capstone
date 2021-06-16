package kr.ac.hansung.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter

@Entity
@Table(name="user_table")
public class User {
	@Id
	@Email
	@Column(name="email", nullable = false)
	private String userID;
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name="user_plan", joinColumns= @JoinColumn(name="email"), 
					inverseJoinColumns= @JoinColumn(name="plan_id"))
	private List<Plan> plans = new ArrayList<Plan>();
	
}