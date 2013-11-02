package models;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import play.db.ebean.Model;

@Entity
public class Bug extends Model{
	@Id
	public Long id; 
	public String name;
	public boolean isDone;
	public Date duaDate;
	@ManyToOne
	public User assigned;
	public String folder;
	@ManyToOne
	public Project project;
	
	public static Model.Finder<Long, Bug> find = new Model.Finder(Long.class, Bug.class);
	
	public static List<Bug> findTodoInvolving(String user){
		return find.fetch("project").where().eq("done",false).eq("project.member.email",user).findList();
	}
	
	public static Bug create(Bug bug, Long project, String folder){
		bug.project = Project.find.ref(project);
		bug.folder = folder;
		bug.save();
		return bug;
	}
}
