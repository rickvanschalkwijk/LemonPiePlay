package controllers;

import play.*;
import play.mvc.*;
import play.data.*;
import static play.data.Form.*;

import models.*;
import views.html.*;


/**
 * LemonPiePlay
 * Application.java
 * Purpose: Main system controller.
 *
 * @author 	Rick van Schalkwijk
 * @date	27/11/13
 * @version 0.1 
 */
public class Application extends Controller {
	
	/**
	 * Gets all project and bugs.
	 *
	 * @return Object Result.
	 */
    public static Result index() {
        return ok(index.render(
        			Project.find.all(),
        			Bug.find.all()
        		));
    }
}