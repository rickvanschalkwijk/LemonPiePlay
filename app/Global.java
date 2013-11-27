import java.util.List;

import com.avaje.ebean.Ebean;

import models.*;
import play.*;
import play.libs.Yaml;

public class Global extends GlobalSettings{
	@Override
	public void onStart(Application application){
		if(User.find.findRowCount() == 0){
			Ebean.save((List) Yaml.load("initial-data.yml"));
		}
	}
}
